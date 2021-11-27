class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :vendor_name
      t.string :vendor_location
      t.references :convention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
