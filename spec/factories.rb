Factory.define :user do |f|
  f.name        { Faker::Name.name }
  f.email       { Faker::Internet.email }
  f.provider    { "twitter" }
  f.uid         { 1_000_000 + Random.rand(10_000_000 - 1_000_000) }
end

Factory.define :need do |f|
  f.association :user
  f.body    { "I need help hiring someone." }
end

Factory.define :email do |f|
  f.association :sender, :factory => :user
  f.association :receiver, :factory => :user
  f.association :need
  f.subject     { "Need Help!" }
  f.body        { "I need help hiring someone." }
end