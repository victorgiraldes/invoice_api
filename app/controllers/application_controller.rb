class ApplicationController < ActionController::API
  def authenticate_user
    head :forbidden unless current_user
  end

  def current_user
    user = User.find_by(token: request.headers['Authorization'])

    user&.verified? ? user : nil
  end
end
