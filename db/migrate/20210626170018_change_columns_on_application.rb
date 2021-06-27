class ChangeColumnsOnApplication < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_applications, :first_choice
    remove_column :event_applications, :second_choice
    remove_column :event_applications, :third_choice

    add_column :event_applications, :best_choice, :string
    add_column :event_applications, :good_choice, :string
    add_column :event_applications, :dont_care, :string
    add_column :event_applications, :would_rather_not, :string
    add_column :event_applications, :cant_do, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
