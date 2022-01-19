class User
  module Auth
    class Logout < Micro::Case
      attributes :user

      validates :user, presence: true

      def call!
        user.update(token: nil, token_status: nil)

        Success result: { user: user }
      end
    end
  end
end
