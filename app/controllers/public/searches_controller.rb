class Public::SearchesController < Public::ApplicationController

    def posts
      @content = params[:content]
      @method = params[:method]
      if params[:content].nil?
            @posts =[]
      elsif @content.blank?
        flash.now[:alert] = "検索ワードを入力してください"
        @posts = []
      else
        @posts = Post.search_for(@content, @method)

        if @posts.empty?
          flash.now[:alert] = "該当する投稿が見つかりませんでした"
        end
      end
    end

    def users
      @content = params[:content]
      @method = params[:method]
    if params[:content].nil?
      @users =[]
    elsif @content.blank?
      flash.now[:alert] = "検索ワードを入力してください"
      @users = []
    else
      @users = User.search_for(@content, @method)
    
      if @users.empty?
        flash.now[:alert] = "該当するユーザーが見つかりませんでした"
      end
    end
  end
end

