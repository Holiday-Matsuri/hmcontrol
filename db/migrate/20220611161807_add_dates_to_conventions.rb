class AddDatesToConventions < ActiveRecord::Migration[6.1]
  def change
    add_column :conventions, :start_date, :date
    add_column :conventions, :end_date, :date
  end
end
