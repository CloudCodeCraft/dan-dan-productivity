class TaskTimer < ApplicationRecord
  belongs_to :user
  belongs_to :timed_task
end
