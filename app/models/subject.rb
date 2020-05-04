class Subject < ApplicationRecord
  enum status: { New: 'New', Old: 'Old' }

  validates :topic, :description, presence: true
end
