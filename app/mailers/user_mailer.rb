class UserMailer < ApplicationMailer
  def verify_token
    @user = params[:user]
    @url  = "http://locahost:3000/users/verify_token?token=#{@user.token}"
    mail(to: @user.email, subject: 'Acesse o email para verificar seu token')
  end
end
