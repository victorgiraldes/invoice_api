class Invoice < ApplicationRecord
  belongs_to :user
  has_many :mailing_addresses
end
