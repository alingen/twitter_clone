class UsersController < ApplicationController
  def withdrawal
    # @user = User.find(params[:id])
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to '/'
  end

  def show
  end
end
