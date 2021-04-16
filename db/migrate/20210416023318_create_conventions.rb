class CreateConventions < ActiveRecord::Migration[6.1]
  def change
    create_table :conventions do |t|
      t.integer :year
      t.string :address
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
