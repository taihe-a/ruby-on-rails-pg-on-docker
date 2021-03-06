class Task < ApplicationRecord
  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  validates :name, presence: true
  validates :detail, length: { minimum: 10 }

  enum progress: { WAITING: 1, WORKING: 2, COMPLETED: 3 }
  enum priority: { HIGH: 1, MIDDLE: 2, LOW: 3 }

  scope :search, lambda { |search|
    return if search.blank?

    name_like(search[:name])
      .progress_is(search[:progress])
      .priority_is(search[:priority])
  }

  scope :name_like, ->(name) { where('tasks.name LIKE ?', "%#{name}%") if name.present? }
  scope :progress_is, ->(progress) { where(progress: progress) if progress.present? }
  scope :priority_is, ->(priority) { where(priority: priority) if priority.present? }
end
