require 'date'

namespace :ml do
  desc "Feed database with relevant tweets"
  task feed: :environment do
    seed = DateTime.now.strftime('%Q')
    text = `cd ml/char-rnn && ~/torch/install/bin/th sample.lua \
            cv/brain -seed #{seed}`

    print_yet = false # Wait for ----- line to start printing

    @fetty_trump = TweetSource.find_by(name: "FettyTrump")
    text.each_line do |line|
      line = line.strip
      if print_yet && !line.empty?
        # Add this as a tweet
        @new_tweet = Tweet.new
        @new_tweet.score = 0
        @new_tweet.text = line
        @new_tweet.tweet_source = @fetty_trump
        if(@new_tweet.save)
          puts "added #{line}"
        end
      elsif line[4] == "-"
        print_yet = true
      end
    end
  end

  desc "Clear all Fetty Wap's tweets"
  task clear: :environment do
    @fetty_trump = TweetSource.find_by(name: "FettyTrump")
    Tweet.where('tweet_source_id = ?', @fetty_trump.id).each do |tweet|
      text = tweet.text
      if(tweet.destroy)
        puts "destroyed #{text}\n"
      end
    end
  end
end
