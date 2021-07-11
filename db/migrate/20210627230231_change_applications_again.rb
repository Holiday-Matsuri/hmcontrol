class ChangeApplicationsAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_applications, :friday_best_choice
    remove_column :event_applications, :friday_good_choices
    remove_column :event_applications, :friday_dont_cares
    remove_column :event_applications, :friday_would_rather_nots
    remove_column :event_applications, :friday_cant_dos

    remove_column :event_applications, :saturday_best_choice
    remove_column :event_applications, :saturday_good_choice
    remove_column :event_applications, :saturday_dont_care
    remove_column :event_applications, :saturday_would_rather_not
    remove_column :event_applications, :saturday_cant_do

    remove_column :event_applications, :sunday_best_choice
    remove_column :event_applications, :sunday_good_choice
    remove_column :event_applications, :sunday_dont_care
    remove_column :event_applications, :sunday_would_rather_not
    remove_column :event_applications, :sunday_cant_do
  end
end