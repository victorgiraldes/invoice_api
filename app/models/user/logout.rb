module User
  class Logout < Micro::Case
    attributes :token

    validates :token

    def call!
      user = User.find_by(token: token)

      Failure(:invalid_token) { { error: 'Token Invalid' } } if user.nil?

      user.update(token: nil, token_status: nil)

      return Success { { user: user } } unless user.errors.any?
    end
  end
end
