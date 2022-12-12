class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:notice] = "投稿を作成しました"
      redirect_to root_path
    else
      render("tweets/new")
    end
  end

  private
    
    def tweet_params
      params.require(:tweet).permit(:text)
    end

end
