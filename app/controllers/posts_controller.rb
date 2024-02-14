class PostsController < ApplicationController
    # app/controllers/posts_controller.rb
    before_action :authenticate_user!, only: [:new, :create]
    
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
        @post = Post.find_by(id: params[:id])
        if @post.nil?
          flash[:alert] = "Post not found or you don't have permission to edit it."
          redirect_to posts_path
        end
    end
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
    
end
  

