class CommentsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    @comments = Comment.where(tweet_id: @tweet.id)
  end

  def new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "投稿を作成しました"
      redirect_to comment_path
    else
      render("tweets/new")
    end
  end

  private
    
    def comment_params
      params.permit(:text).merge(tweet_id: params[:id])
    end

end
