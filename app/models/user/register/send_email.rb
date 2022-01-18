class User
  module Register
    class SendEmail < Micro::Case
      attributes :user

      def call!
        UserMailer.with(user: user).verify_token.deliver_now!

        Success result: { user: user }
      end
    end
  end
end
