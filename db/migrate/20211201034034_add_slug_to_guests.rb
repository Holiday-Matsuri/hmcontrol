class AddSlugToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :slug, :string
    add_index :guests, :slug, unique: true
  end
end
