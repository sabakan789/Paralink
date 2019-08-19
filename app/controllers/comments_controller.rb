class CommentsController < ApplicationController
  def new
    @micropost = Micropost.new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to microposts_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :micropost_id, :user_id)
  end
end
