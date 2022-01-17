FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    token { SecureRandom.hex(10) }
    token_status { 'verified' }

    trait :token_status_pending do
      token_status { 'pending' }
    end

    trait :token_status_verified do
      token_status { 'verified' }
    end
  end
end
