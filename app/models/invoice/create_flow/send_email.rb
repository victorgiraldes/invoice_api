class Invoice
  class CreateFlow
    class SendEmail < Micro::Case
      attributes :invoice

      def call!
        invoice.mailing_addresses.each do |mailing_address|
          InvoiceMailer.with(invoice: invoice, email: mailing_address.email).send_invoice.deliver_later
        end

        return Success result: { invoice: invoice }
      end
    end
  end
end
