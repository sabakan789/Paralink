class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: user_email[:email])
    if user && user.authenticate(user_password[:password])
      log_in user
      redirect_to @user, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def user_email
    params.require(:session).permit(:email)
  end

  def user_password
    params.require(:session).permit(:password)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
