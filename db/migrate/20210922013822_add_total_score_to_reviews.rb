class AddTotalScoreToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :total_score, :integer
  end
end
