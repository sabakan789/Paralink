class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find_by(id:params[:id])
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)

    if @micropost.save
      redirect_to root_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    if @micropost.destroy
      redirect_to :back, success: '投稿を削除しました'
    else
      flash.now[:danger] = '投稿の削除に失敗しました'
      render :index
    end
  end


  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
