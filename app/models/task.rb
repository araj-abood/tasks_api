class Task < ApplicationRecord
  validates :task, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
end
