class Listing < ApplicationRecord
  # Constants
  CATEGORIES = ['Powered Speakers', 'CD and USB Players', 'DJ Controllers', 'Subwoofers', 'Studio Monitors', 'DJ Mixers', 'Turntables', 'Headphones'].sort

  # Associations
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :image

  # Validations
  validates :price, numericality: true

  include PgSearch::Model
  pg_search_scope :search_by_name_description_and_category,
                  against: [
                    [:name, 'A'],
                    [:description, 'B'],
                    [:category, 'C']
                  ],
                  associated_against: {
                    user: %i[address]
                  },
                  using: { tsearch: { prefix: true } }
end
