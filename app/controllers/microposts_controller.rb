class MicropostsController < ApplicationController
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.micropost.new(micropost_params)

    if @micropost.save
      redirect_to micropost_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
