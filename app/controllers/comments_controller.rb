class CommentsController < ApplicationController
  before_action :login_check
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render 'index.js.erb'
    else
      redirect_to micropost_path(@comment.micropost), danger: 'コメントに失敗しました'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:comment_id])
    if @comment.destroy
      render 'index.js.erb'
    else
      redirect_to micropost_path(@comment.micropost.id), danger: 'コメントの削除に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :micropost_id, :user_id)
  end
end
