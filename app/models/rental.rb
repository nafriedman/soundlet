class Rental < ApplicationRecord
  validates :from, presence: true
  validates :until, presence: true
  belongs_to :user
  belongs_to :listing
end
