class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :description))
        @post.user_id = current_user.id
        if @post.save
            redirect_to root_path
        else
            render "new"
        end
    end

    def show
    
    end


end
