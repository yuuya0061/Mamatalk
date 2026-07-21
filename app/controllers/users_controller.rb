class UsersController < ApplicationController
   
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
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

def edit
  @user = Current.user
end

def update
  @user = Current.user
  if @user.update(profile_params)
    redirect_to user_path(@user), notice: "更新しました"
  else
    flash.now[:alert] = "更新失敗しました"
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  user = Current.user
  terminate_session
  user.destroy
  redirect_to root_path, notice: "退会しました", status: :see_other
end


  private

  def sign_up_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end

   def profile_params
    params.require(:user).permit(:name, :profile_image, :email_address, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to Current.user if @user != Current.user
  end  
end

