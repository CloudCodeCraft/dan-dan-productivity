FactoryBot.define do
  factory :timed_task do
    name { "MyString" }
    notes { "MyString" }
    user { nil }
    timed_project { nil }
  end
end
