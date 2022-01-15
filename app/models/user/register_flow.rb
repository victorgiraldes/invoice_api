class User
  class RegisterFlow < Micro::Case
    flow Register::Create,
         Register::GenerateToken,
         Register::SendEmail
  end
end
