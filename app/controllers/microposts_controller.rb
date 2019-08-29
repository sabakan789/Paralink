class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find_by(id: params[:id])
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      redirect_to root_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      redirect_to :back
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_path, info: '投稿を削除しました'
  end

  def search
    @search_m = Micropost.ransack(params[:q])
    @search_microposts = @search_m.result
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
