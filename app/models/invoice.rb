class Invoice < ApplicationRecord
  belongs_to :user
  has_many :mailing_addresses, dependent: :destroy

  monetize :price_cents
end
