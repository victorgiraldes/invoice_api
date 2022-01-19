class AuthController < ApplicationController
  before_action :authenticate_user, only: :destroy

  def destroy
    User::Auth::Logout
      .call(user: current_user)
      .on_success { |result| render json: { message: result[:message] }, status: 200 }
      .on_failure { |result| render json: { error: 'Token Inválido' }, status: 400 }
  end
end
