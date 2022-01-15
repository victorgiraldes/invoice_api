module User
  class VerifyToken < Micro::Case
    attributes :token

    validates :token

    def call!
      user = User.find_by(token: token)

      Failure(:invalid_token) { { error: 'Token Invalid' } } if user.nil?

      user.update(token_status: 'verified')

      return Success { { message: 'Token Verificado' } } if user&.verified?
    end
  end
end
