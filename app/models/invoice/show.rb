class Invoice::Show < Micro::Case
  attributes :user, :params

  def call!
    invoice = user.invoices.find_by(id: params[:id])

    return Success result: { invoice: invoice } if invoice

    Failure(:invoice_not_found) { { errors: 'Invoice not found' } }
  end
end
