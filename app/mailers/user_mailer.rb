class UserMailer < ApplicationMailer
  def verify_token
    @user = params[:user]

    @url  = "http://localhost:8080/auth/#{@user.token}"

    mail(to: @user.email, subject: 'Acesse o email para verificar seu token')
  end
end
