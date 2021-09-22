class DropApplicationReviews < ActiveRecord::Migration[6.1]
  def change
    drop_table :application_reviews
  end
end
