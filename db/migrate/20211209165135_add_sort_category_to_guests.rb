class AddSortCategoryToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :sort_category, :integer
  end
end
