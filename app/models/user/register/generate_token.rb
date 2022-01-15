class User
  module Register
    class GenerateToken < Micro::Case
      attributes :user

      def call!
        user.update(token: SecureRandom.base64(12), token_status: 'pending')

        Success result: { user: user }
      end
    end
  end
end
