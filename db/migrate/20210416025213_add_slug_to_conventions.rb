class AddSlugToConventions < ActiveRecord::Migration[6.1]
  def change
    add_column :conventions, :slug, :string
    add_index :conventions, :slug, unique: true
  end
end
