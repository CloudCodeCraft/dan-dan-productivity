class TimedTask < ApplicationRecord
  belongs_to :user
  belongs_to :timed_project
end
