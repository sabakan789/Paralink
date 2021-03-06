class MicropostsController < ApplicationController
  before_action :login_check, only: %i[new search show create destroy]
  def new
    @micropost = Micropost.new
  end

  def index
    @microposts = Micropost.page(params[:page]).per(10)
    @search_micropost = Micropost.ransack(params[:q])
    @search_microposts = @search_micropost.result.page(params[:page]).per(10)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @comments = @micropost.comments
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      redirect_to microposts_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to microposts_path, info: '投稿を削除しました'
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
