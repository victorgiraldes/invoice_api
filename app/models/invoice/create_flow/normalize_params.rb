class Invoice
  class CreateFlow
    class NormalizeParams < Micro::Case
      attributes :user, :params

      def call!
      invoice_params = {
                         emails: params[:emails].split(','),
                         number: params[:number],
                         company_info: params[:company_info],
                         charge_info: params[:charge_info],
                         price_cents: (params[:price_cents].remove(',').to_i * 100)
                       }

         Success result: { params: invoice_params }
      end
    end
  end
end
