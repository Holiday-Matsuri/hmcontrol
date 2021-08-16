class AddCapToConventions < ActiveRecord::Migration[6.1]
  def change
    add_column :conventions, :panel_soft_cap, :string
    add_column :conventions, :panel_soft_cap_date, :date
    add_column :conventions, :panel_hard_cap_date, :date
    add_column :conventions, :panel_cap_reached, :boolean    
  end
end
