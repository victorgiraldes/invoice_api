class UserMailer < ApplicationMailer
  def verify_token
    @user = params[:user]

    @url  = "#{ENV.fetch('BASE_URL')}/users/verify_token?token=#{@user.token}"

    mail(to: @user.email, subject: 'Acesse o email para verificar seu token')
  end
end
