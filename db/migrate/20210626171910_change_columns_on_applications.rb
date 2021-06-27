class ChangeColumnsOnApplications < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_applications, :best_choice, :friday_best_choice
    rename_column :event_applications, :good_choice, :friday_good_choice
    rename_column :event_applications, :dont_care, :friday_dont_care
    rename_column :event_applications, :would_rather_not, :friday_would_rather_not
    rename_column :event_applications, :cant_do, :friday_cant_do

    add_column :event_applications, :saturday_best_choice, :string
    add_column :event_applications, :saturday_good_choice, :string
    add_column :event_applications, :saturday_dont_care, :string
    add_column :event_applications, :saturday_would_rather_not, :string
    add_column :event_applications, :saturday_cant_do, :string

    add_column :event_applications, :sunday_best_choice, :string
    add_column :event_applications, :sunday_good_choice, :string
    add_column :event_applications, :sunday_dont_care, :string
    add_column :event_applications, :sunday_would_rather_not, :string
    add_column :event_applications, :sunday_cant_do, :string
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
