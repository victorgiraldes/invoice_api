class Invoice
  class CreateFlow < Micro::Case
    flow CreateFlow::NormalizeParams,
         CreateFlow::Create,
         CreateFlow::SendEmail
  end
end
