class FavoritesController < ApplicationController
  before_action :login_check
  def index
    @favorite_microposts = current_user.favorite_microposts
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.micropost_id = params[:micropost_id]
    if favorite.save
      flash[:success] = '’いいね’しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:info] = '’いいね’出来ませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, micropost_id: params[:micropost_id])
    favorite.destroy if favorite.present?
    if favorite.destroyed?
      flash[:danger] = '’いいね’を解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:info] = '’いいね’解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
end
