class FavoritesController < ApplicationController
  def index
    @favorite_microposts = current_user.favorite_microposts
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.micropost_id = params[:micropost_id]

    if favorite.save
      redirect_to microposts_path, success: '’いいね’しました'
    else
      redirect_to microposts_path, danger: '’いいね’出来ませんでした'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, micropost_id: params[:micropost_id])
    favorite.destroy if favorite.present?

    if favorite.destroyed?
      redirect_to microposts_path, success: '’いいね’を解除しました'
    else
      redirect_to microposts_path, danger: '’いいね’解除に失敗しました'
    end
  end
end
