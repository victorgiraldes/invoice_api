class Invoice::List < Micro::Case
  attributes :user

  def call!
    return Success result: { invoices: user.invoices } if user.invoices.any?

    Failure(:invoices_not_found) { { errors: 'Invoices not found' } }
  end
end
