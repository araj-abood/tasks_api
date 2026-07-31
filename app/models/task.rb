class Task < ApplicationRecord
  validates :task, presence: true
  validates :completed, inclusion: { in: [ true, false ], message: "Should be either true / false" }
end
