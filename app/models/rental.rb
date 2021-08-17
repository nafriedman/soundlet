class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :listing, dependent: :destroy
end
