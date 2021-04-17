class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :internal_desc
      t.text :external_desc
      t.integer :status
      t.string :slug
      t.index :slug
      t.references :convention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
