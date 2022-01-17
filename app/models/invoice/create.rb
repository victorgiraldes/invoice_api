class Invoice::Create < Micro::Case
  attributes :user, :params

  def call!
    number = user.invoices.last.nil? ? 1 : user.invoices.last.number + 1

    invoice = user.invoices.create(number: number,
                                   date: params[:date],
                                   company_info: params[:company_info],
                                   charge_info: params[:charge_info],
                                   price_cents: params[:price_cents])

    return Success result: { invoice: invoice } if invoice.persisted?

    Failure(:invalid_invoice_params) { { errors: invoice.errors.as_json } }
  end
end
