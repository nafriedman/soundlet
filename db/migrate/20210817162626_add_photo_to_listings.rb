class AddPhotoToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :photo, :string
  end
end
