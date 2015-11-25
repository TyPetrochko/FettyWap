class CreateTweetSources < ActiveRecord::Migration
  def change
    create_table :tweet_sources do |t|
      t.string :name
      t.text :bio

      t.timestamps null: false
    end
  end
end
