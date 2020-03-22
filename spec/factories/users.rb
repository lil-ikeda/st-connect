FactoryBot.define do

  factory :user do
    id                    { 1 }
    name                  { "abe" }
    password              { "00000000" }
    password_confirmation { "00000000" }
    image                 { "test.jpg" }
    profile               { "hello" }
    instagram             { "instagram_account" }
    sequence(:email) { Faker::Internet.email }
  end

end