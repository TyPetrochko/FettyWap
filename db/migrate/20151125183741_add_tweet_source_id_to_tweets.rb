class AddTweetSourceIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_source_id, :integer
    add_index :tweets, :tweet_source_id
  end
end
