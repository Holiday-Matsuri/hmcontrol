class AddCommentsToApplicationReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :application_reviews, :comments, :text
  end
end
