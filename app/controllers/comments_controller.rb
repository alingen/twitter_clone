class CommentsController < ApplicationController
  def show
    @tweet = Tweet.find_by(id: params[:id])
    @comments = Comment.where(tweet_id: @tweet.id)
  end

  def new
  end

  def create
    @comment = Comment.new(user_id: current_user.id, tweet_id: params[:id], text: params[:text])
    if @comment.save
      flash[:notice] = "投稿を作成しました"
      redirect_to comment_path
    else
      render("tweets/new")
    end
  end
end
