class UsersController < ApplicationController
  before_action :user_search
  def new
    @user = User.new
  end

  def user_search
    @search_u = User.ransack(params[:q])
    @search_users = @search_u.result
  end

  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @profile = @user.profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        redirect_to @user, success: '登録情報を編集しました'
      else
        flash.now[:danger] = '編集に失敗しました'
        render :edit and return
      end
    else
      redirect_to root_url
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def destroy
    User.find_by(id: current_user.id).destroy
    redirect_to root_path, success: '退会しました'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
