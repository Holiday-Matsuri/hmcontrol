class AddPanelCategoryToEventApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :event_applications, :panel_category, :string
  end
end
