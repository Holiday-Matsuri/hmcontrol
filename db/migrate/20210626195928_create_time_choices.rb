class CreateTimeChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :time_choices do |t|
      t.references :event_application, null: false, foreign_key: true
      t.integer :fri_8_to_11
      t.integer :fri_11_to_14
      t.integer :fri_14_to_17
      t.integer :fri_17_to_20
      t.integer :fri_20_to_23
      t.integer :fri_23_to_2

      t.integer :sat_8_to_11
      t.integer :sat_11_to_14
      t.integer :sat_14_to_17
      t.integer :sat_17_to_20
      t.integer :sat_20_to_23
      t.integer :sat_23_to_2

      t.integer :sun_8_to_11
      t.integer :sun_11_to_14
      t.integer :sun_14_to_17

      t.timestamps
    end
  end
end
