Factory.define :user do |f|
  f.name        { Faker::Name.name }
  f.email       { Faker::Internet.email }
  f.provider    { "twitter" }
  f.uid         { 1_000_000 + Random.rand(10_000_000 - 1_000_000) }
  f.house_rules { true }
end

Factory.define :query do |f|
  f.association :user
  f.question    { "I have a question about my startup." }
end

Factory.define :email do |f|
  f.association :sender, :factory => :user
  f.association :receiver, :factory => :user
  f.association :query
  f.subject     { "Need Help!" }
  f.body        { "I have a question about my startup." }
end