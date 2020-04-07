class Task < ApplicationRecord
  validates :name, presence: true
  validates :detail, length: { minimum: 10 }

  enum progress: { WAITING: 1, WORKING: 2, COMPLETED: 3 }

  scope :search, lambda { |search|
    return if search.blank?

    name_like(search[:name])
      .progress_is(search[:progress])
  }

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :progress_is, -> (progress) { where(progress: progress) if progress.present? }
end
