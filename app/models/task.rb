class Task < ApplicationRecord
    validates :name, presence: true
    validates :detail, length: { minimum: 10 }
end
