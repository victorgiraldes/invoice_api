class Invoice
  class CreateFlow
    class NormalizeParams < Micro::Case
      attributes :user, :params

      def call!
        if !params[:number].is_a?(String) || normalized_price.nil?
          Failure :invalid_invoice_params, result: {
            errors: 'Informe pelo menos o número e o valor da cobrança'
          }
        else
          invoice_params = {
            emails: params[:emails]&.split(',')&.map(&:squish),
            number: params[:number],
            date: params[:date],
            company_info: params[:company_info],
            charge_info: params[:charge_info],
            price_cents: normalized_price
          }

          Success result: { params: invoice_params }
        end
      end

      private def normalized_price
        return if params[:price_cents].nil?

        return unless params[:price_cents].remove(',').scan(/\D/).empty?

        params[:price_cents].scan(',').any? ? params[:price_cents].remove(',').to_i : (params[:price_cents].to_i * 100)
      end
    end
  end
end
