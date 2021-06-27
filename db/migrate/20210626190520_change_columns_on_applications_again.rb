class ChangeColumnsOnApplicationsAgain < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_applications, :friday_good_choice, :friday_good_choices
    rename_column :event_applications, :friday_dont_care, :friday_dont_cares
    rename_column :event_applications, :friday_would_rather_not, :friday_would_rather_nots
    rename_column :event_applications, :friday_cant_do, :friday_cant_dos
  end
end
