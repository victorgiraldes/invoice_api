class User
  class VerifyToken < Micro::Case
    attributes :token

    def call!
      user = User.find_by(token: token)

      return Failure(:invalid_token) { { error: 'Token Invalid' } } if user.nil?

      user.update(token_status: 'verified')

      Success result: { message: 'Token Verificado' } if user&.verified?
    end
  end
end
