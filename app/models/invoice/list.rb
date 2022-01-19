class Invoice
  class List < Micro::Case
    attributes :user

    def call!
      Success result: { invoices: user.invoices }
    end
  end
end
