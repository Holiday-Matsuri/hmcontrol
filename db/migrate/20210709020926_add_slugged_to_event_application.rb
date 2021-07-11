class AddSluggedToEventApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :event_applications, :slug, :string
    add_index :event_applications, :slug, unique: true
  end
end
