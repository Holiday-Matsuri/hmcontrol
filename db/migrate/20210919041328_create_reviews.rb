class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :feasibility
      t.integer :relevance
      t.integer :structure
      t.integer :fun_factor
      t.integer :style
      t.text :comments
      t.references :event_application
      t.references :user

      t.timestamps
    end
  end
end
