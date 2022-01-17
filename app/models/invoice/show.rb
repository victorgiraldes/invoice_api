class Invoice::Show < Micro::Case
  attributes %i[user invoice_id]

  validates :user, type: User
  validates :invoice_id, numericality: { only_integer: true }

  def call!
    invoice = User.invoices.find_by(id: params[:id])

    return Success { { invoice: invoice } } if invoice

    Failure(:invoice_not_found) { { errors: 'invoice not found' } }
  end
end
