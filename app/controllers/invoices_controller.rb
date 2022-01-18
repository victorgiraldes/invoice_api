class InvoicesController < ApplicationController
  before_action :authenticate_user

  def create
    Invoice::Create
      .call(user: current_user, params: params)
      .on_success { |result| render json: { invoice: result[:invoice] }, status: 200 }
      .on_failure(:invalid_invoice_params) { |result| render json: { error: result[:errors] }, status: 400 }
  end

  def index
    Invoice::List
      .call(user: current_user, params: params)
      .on_success { |result| render json: { invoices: result[:invoices] }, status: 200 }
  end

  def show
    Invoice::Show
      .call(user: current_user, params: params)
      .on_success { |result| render json: { invoice: result[:invoice] }, status: 200 }
      .on_failure(:invoice_not_found) { |result| render json: { errors: result[:errors] }, status: 400 }
  end

  def destroy
    Invoice::Destroy
      .call(user: current_user, params: params)
      .on_success { head :no_content }
      .on_failure(:invoice_not_found) { |result| render json: { errors: result[:error] }, status: 400 }
  end
end
