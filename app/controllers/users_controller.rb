class UsersController < ApplicationController
  before_action :set_user

  def withdrawal
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def show
    @tweets = Tweet.order(created_at: :desc).where(user_id: params[:id])
  end

  def reply
    @tweets = @user.tweet_and_reply
  end


  def likes
    @likes = Like.where(user_id: params[:id])
  end

  def update
    @user.image = params[:image]
    @user.save
    redirect_to @user
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
