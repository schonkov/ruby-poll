class Poll < ApplicationRecord
  has_many :answers, dependent: :destroy
  # Validation
  validates :question, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true
  scope :open, -> { where( is_published: false) }
end
