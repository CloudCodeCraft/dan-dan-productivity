FactoryBot.define do
  factory :session do
    user { nil }
    bearer_token { "MyString" }
  end
end
