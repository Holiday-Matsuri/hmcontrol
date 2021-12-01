class AddEncodedImageToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :encoded_image, :text
  end
end
