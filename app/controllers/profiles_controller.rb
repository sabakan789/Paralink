class ProfilesController < ApplicationController
  before_action :login_check
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(@profile), success: 'プロフィールを作成しました'
    else
      flash.now[:danger] = 'プロフィールの作成に失敗しました'
      render :new
    end
  end

  def edit
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @profile = Profile.find_by(user_id: params[:user_id])
    if @profile.update(profile_params)
      redirect_to user_path(@profile.user.id), success: 'プロフィールを編集しました'
    else
      flash.now[:danger] = 'プロフィールの編集に失敗しました'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:profile, :userimage, :user_id)
  end
end
