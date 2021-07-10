FactoryBot.define do
  factory :user do
    sequence(:family_name) {"kimu"}
    sequence(:given_name) {"taku"}
    sequence(:display_name) {"kimutaku"}
    sequence(:email) { |n|"TEST#{n}@example.com" }
    sequence(:password) {"kimutakutest"}
  end
end
