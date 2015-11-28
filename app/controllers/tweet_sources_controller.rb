class TweetSourcesController < ApplicationController
  def show
    @tweet_source = TweetSource.find(params[:id])
    @tweets = @tweet_source.tweets.sort_by{|tweet| tweet.created_at}.reverse
  end

  def index
    @tweet_sources = TweetSource.all
  end

  private
    def tweet_source_params
      params.require(:tweet_source).permit(:name, :bio)
    end
end
