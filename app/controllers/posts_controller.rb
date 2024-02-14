class PostsController < ApplicationController
    # app/controllers/posts_controller.rb
    before_action :authenticate_user!, only: [:new, :create, :edit]
    
    def index
      @posts = Post.all
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
  

