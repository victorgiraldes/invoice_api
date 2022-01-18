class UsersController < ApplicationController
  def create
    User::RegisterFlow
      .call(email: params[:email])
      .on_success { |result| render json: { user: result[:user] }, status: 200 }
      .on_failure { |result| render json: { errors: result[:error] }, status: 400 }
  end

  def verify_token
    User::VerifyToken
      .call(token: params[:token])
      .on_success { |result| render json: { message: result[:message] }, status: 200 }
      .on_failure { |result| render json: { error: result[:invalid_token] }, status: 400 }
  end
end
