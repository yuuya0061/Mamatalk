class Public::FavoritesController < Public::ApplicationController
  def create
    post= Post.find(params[:post_id])
    favorite = Current.user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
  end

   def index
    @posts = Current.user.favorite_posts
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Current.user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end

end
