class AddPanelReviewLockCountToConventions < ActiveRecord::Migration[6.1]
  def change
    add_column :conventions, :panel_review_lock_count, :integer
  end
end
