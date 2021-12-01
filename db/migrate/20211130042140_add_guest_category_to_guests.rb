class AddGuestCategoryToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :guest_category, :string
  end
end
