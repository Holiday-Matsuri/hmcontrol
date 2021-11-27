class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :guest_name
      t.text :guest_description
      t.references :convention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
