class UsersController < ApplicationController
  def withdrawal
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to '/'
  end

  def show
    @user = User.new(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.image = params[:image]
    @user.save
    redirect_to @user
  end
end
