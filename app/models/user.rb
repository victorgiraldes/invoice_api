class User < ApplicationRecord
  has_many :invoices

  enum token_status: %i[pending verified]
end
