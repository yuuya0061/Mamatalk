class UsersController < ApplicationController
   allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to posts_path, notice: "新規登録完了！！"
    else
      flash.now[:alert] = "新規登録失敗"
      render :new,status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :profile_image, :introduction)
  end
  
end

