class Rental < ApplicationRecord
  STATUS = %w(pending approved declined completed)
  
  validates :from, presence: true
  validates :until, presence: true
  belongs_to :user
  belongs_to :listing

end
