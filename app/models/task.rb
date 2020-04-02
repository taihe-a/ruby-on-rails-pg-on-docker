class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, length: { minimum: 10 }
end
