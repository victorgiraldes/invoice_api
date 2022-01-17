FactoryBot.define do
  factory :invoice do
    number { Faker::Number.number(digits: 5).to_s }
    date { Date.today }
    company_info { 'This is a company information' }
    charge_info { 'This is a charge information' }
    price_cents { Faker::Number.number(digits: 5) }
    user
  end
end
