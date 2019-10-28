class UsersController < ApplicationController
  before_action :login_check, only: %i[search index show edit update follows followers destroy]
  before_action :set_user, only: %i[show edit update destroy follows followers]
  def new
    @user = User.new
  end

  def index
    @search_user = User.ransack(params[:q])
    @search_users = @search_user.result.page(params[:page]).per(20)
  end

  def show
    @microposts = @user.microposts
    @profile = @user.profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: '登録に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if current_user == @user && @user.uid == '0'
      if @user.update(user_params)
        redirect_to @user, success: '登録情報を編集しました'
      else
        flash.now[:danger] = '編集に失敗しました'
        render(:edit) && return
      end
    elsif current_user == @user
      if @user.update(user_name)
        redirect_to @user, success: '登録情報を編集しました'
      else
        flash.now[:danger] = '編集に失敗しました'
        render(:edit) && return
      end
    else
      redirect_to root_url
    end
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def destroy
    User.find(current_user.id).destroy
    redirect_to root_path, success: '退会しました'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_name
    params.require(:user).permit(:name)
  end
end
