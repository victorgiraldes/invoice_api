class User
  module Register
    class Create < Micro::Case
      attributes :email

      def call!
        user = User.find_or_create_by(email: email)

        return Success result: { user: user } if user.persisted?

        Failure(:invalid_user_params) { { error: 'Email inválido' } }
      end
    end
  end
end
