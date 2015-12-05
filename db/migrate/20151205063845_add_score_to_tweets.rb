class AddScoreToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :score, :integer
  end
end
