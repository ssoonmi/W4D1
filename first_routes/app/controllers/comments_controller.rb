class CommentsController < ApplicationController
  def index
    if params[:user_id]
      render json: User.find(params[:user_id]).comments
    else
      render json: Artwork.find(params[:artwork_id]).comments
    end 
  end


  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      render json: @comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :artwork_id)
  end
end
