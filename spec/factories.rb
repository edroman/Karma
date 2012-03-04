FactoryGirl.define do
  factory :user do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    provider    { "twitter" }
    uid         { 1_000_000 + Random.rand(10_000_000 - 1_000_000) }
  end
end

FactoryGirl.define do
  factory :need do
    association :user
    body    { "I need help hiring someone." }
  end
end

FactoryGirl.define do
  factory :email do
    association :sender, :factory => :user
    association :receiver, :factory => :user
    association :need
    subject     { "Need Help!" }
    body        { "I need help hiring someone." }
  end
end