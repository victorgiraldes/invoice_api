class Invoice::Destroy < Micro::Case
  attributes :user, :params

  def call!
    invoice = user.invoices.find_by(id: params[:id])&.destroy

    return Success result: { invoice: invoice } if invoice

    Failure(:invoice_not_found) { { error: 'Invoice not found' } }
  end
end
