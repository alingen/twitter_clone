class TweetsController < ApplicationController
  def new
  end
  def create
    @tweet = Tweet.new(user_id: current_user.id, text: params[:text])
    if @tweet.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/")
    else
      render("tweets/new")
    end
  end
end
