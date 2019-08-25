class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to micropost_path(@comment.micropost.id), success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to micropost_path(@comment.micropost.id), info: 'コメントを削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :micropost_id, :user_id)
  end
end
