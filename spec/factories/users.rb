FactoryBot.define do
  factory :user do
    family_name {"kimu"}
    given_name {"taku"}
    display_name {"kimutaku"}
    email { "kimutaku@example.com" }
    password {"kimutakutest"}
  end
end
