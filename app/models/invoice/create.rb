class Invoice::Create < Micro::Case
  attributes :company, :charge

  def call!
    user = User.find_by(email: params[:email])

    number = user.invoices.last.nil? ? 1 : user.invoices.last.number + 1

    invoice = user.invoices.create(number: number,
                                   date: Time.zone.now,
                                   company: params[:company],
                                   charge: params[:charge],
                                   price: (1..100).sample)

    return Success { { invoice: invoice } } if invoice.persisted?

    Failure(:invalid_invoice_params) { { errors: invoice.errors.as_json } }
  end

  private

  def invoice_attributes
    { email: email }
  end
end
