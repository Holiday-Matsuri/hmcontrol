class CreateEventApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :event_applications do |t|
      t.string :event_name
      t.string :internal_desc
      t.string :external_desc
      t.string :host_stage_name
      t.string :age_rating
      t.boolean :agreed_to_terms
      t.string :first_choice
      t.string :second_choice
      t.string :third_choice
      t.string :event_length
      t.boolean :previous_convention
      t.integer :application_score
      t.integer :application_status
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
