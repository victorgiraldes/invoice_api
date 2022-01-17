class Invoice::Params < Micro::Case
  attributes :id

  def call!
    invoice = User.invoices.find_by(id: params[:id])

    return Success { { invoice: invoice } } if invoice

    Failure(:invoice_not_found) { { errors: 'invoice not found' } }
  end
end
