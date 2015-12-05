class UpvoteController < ApplicationController
  def upvote
    @to_update = Tweet.find(params[:id])
    @to_update.score = @to_update.score + 1
    if @to_update.save
      render json: @to_update
    else
      render nothing: true
    end
  end

  def downvote
    @to_update = Tweet.find(params[:id])
    @to_update.score = @to_update.score - 1
    if @to_update.save
      render json: @to_update
    else
      render nothing: true
    end
  end
end
