class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:post_id, :comments))
    @comment.user_id = current_user.id
    if @comment.save
      flash[:alert] = "Your comments have been saved"
    else
      flash[:alert] = "There was an error with your comments"
    end
    redirect_to post_path(params[:comment][:post_id])
  end
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post_id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    updated_comment = params[:comment][:comments]
    if (comment.comments != updated_comment)
      comment.comments = updated_comment
    end
    # byebug
    if comment.save
        flash[:alert] = "Your changes have been saved"
    else
        flash[:alert] = "There was an error with your change"
    end
    redirect_to post_path(comment.post_id)
  end
end
