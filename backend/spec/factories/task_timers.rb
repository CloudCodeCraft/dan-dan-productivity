FactoryBot.define do
  factory :task_timer do
    name { "MyString" }
    notes { "MyString" }
    user { nil }
    timed_task { nil }
    start_time { "2026-04-30 00:30:03" }
    end_time { "2026-04-30 00:30:03" }
  end
end
