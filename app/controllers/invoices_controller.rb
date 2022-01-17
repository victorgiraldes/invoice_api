class InvoicesController < ApplicationController
  before_action :authenticate_user

  def create
    Invoice::Create
      .call(user: current_user, params: params)
      .on_success { |result| render_json(200, invoices: result[:invoices]) }
  end

  def index
    Invoice::List
      .call(user: current_user, params: params)
      .on_success { |result| render_json(200, invoices: result[:invoices]) }
  end

  def show
    Invoice::Show
      .call(user: current_user, params: params)
      .on_success { |result| render_json(200, invoices: result[:invoices]) }
  end
end
