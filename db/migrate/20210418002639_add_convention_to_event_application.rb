class AddConventionToEventApplication < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_applications, :convention, null: false, foreign_key: true
  end
end
