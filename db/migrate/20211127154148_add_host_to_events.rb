class AddHostToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :host, :string
  end
end
