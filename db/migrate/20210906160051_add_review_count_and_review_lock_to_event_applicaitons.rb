class AddReviewCountAndReviewLockToEventApplicaitons < ActiveRecord::Migration[6.1]
  def change
    add_column :event_applications, :review_count, :integer, :default => 0
    add_column :event_applications, :review_lock, :boolean, :default => false
  end
end
