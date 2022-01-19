class Invoice
  class CreateFlow
    class SendEmail < Micro::Case
      attributes :invoice

      def call!
        send_invoice_to_emails

        return Success result: { invoice: invoice }
      end

      private def send_invoice_to_emails
        return unless invoice.mailing_addresses.any?

        invoice.mailing_addresses.each do |mailing_address|
          InvoiceMailer.with(invoice: invoice, email: mailing_address.email).send_invoice.deliver_later
        end
      end
    end
  end
end
