class User
  module Register
    class Create < Micro::Case
      attributes :email

      validates :email, presence: true

      def call!
        user = User.find_or_create_by(email: email)

        return Success result: { user: user } if user.persisted?

      rescue ActionController::ParameterMissing => e
        Failure :parameter_missing, result: { error: e.message }
      end
    end
  end
end
