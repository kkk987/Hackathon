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
    
    def display
        @post = Post.find(params[:id])
    end

    def destroy
        # post_id = params[:id]
        Post.find(params[:id]).destroy
        redirect_to posts_show_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        updated_description = params[:post]
        if (post.title != updated_description[:title]) || (post.description != updated_description[:description])
            post.title = updated_description[:title]
            post.description = updated_description[:description]
        end
        # byebug
        if post.save
            flash[:alert] = "Your changes have been saved"
        else
            flash[:alert] = "There was an error with your change"
        end
        redirect_to post_path(post.id)
    end


end
