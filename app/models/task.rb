class Task < ApplicationRecord
    validates :name, presence: true
    validates :detail, length: { minimum: 10 }

    enum progress: {WAITING: 1, WORKING: 2, COMPLETED: 3}
end
