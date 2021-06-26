FactoryBot.define do
  factory :shop do
    sequence(:email) { |n|"TEST#{n}@example.com" }
    sequence(:password) {"kimutakutest"}
    sequence(:name) {"takoyaki"}
    sequence(:description) {"oisiyo"}
  end
end