class Invoice
  class CreateFlow
    class Create < Micro::Case
      attributes :user, :params

      def call!
        Invoice.transaction do
          @invoice = user.invoices.create(number: params[:number],
                                        date: params[:date],
                                        company_info: params[:company_info],
                                        charge_info: params[:charge_info],
                                        price_cents: params[:price_cents])

          params[:emails]&.each do |email|
            MailingAddress.create!(invoice_id: @invoice.id, email: email)
          end
        end

        return Success result: { invoice: @invoice } if @invoice.persisted?

        Failure(:invalid_invoice_params) { { errors: invoice.errors.as_json } }
      end
    end
  end
end
