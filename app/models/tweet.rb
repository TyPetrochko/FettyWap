class Tweet < ActiveRecord::Base
  belongs_to :tweet_source
end
