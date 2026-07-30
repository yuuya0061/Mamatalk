class SearchesController < ApplicationController

    def posts
      @content = params[:content]
      @method = params[:method]

      if @content.present?
        @posts = Post.search_for(@content, @method)
      else
        @posts = []
      end
    end

    def users
      @content = params[:content]
      @method = params[:method]
    
    if @content.present?
      @users = User.search_for(@content, @method)
    else
      @users = []
    end
  end
end

