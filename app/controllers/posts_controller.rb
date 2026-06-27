class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = Current.user.id
    if @post.save
      redirect_to posts_path, notice:"投稿しました！"
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
