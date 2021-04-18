class CreateApplicationReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :application_reviews do |t|
      t.references :convention, null: false, foreign_key: true
      t.references :event_application, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :feasibility
      t.integer :relevance
      t.integer :structure
      t.integer :fun_factor
      t.integer :style

      t.timestamps
    end
  end
end
