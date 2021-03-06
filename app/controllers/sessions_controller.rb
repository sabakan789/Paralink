class SessionsController < ApplicationController
  def new; end

  def create
    auth = request.env['omniauth.auth']
    if auth.present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_path, success: 'ログインしました'
    else
      user = User.find_by(email: user_email[:email])
      if user&.authenticate(user_password[:password])
        log_in user
        redirect_to root_path, success: 'ログインしました'
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render :new
      end
    end
  end

  def destroy
    if !log_out
      redirect_to root_url, info: 'ログアウトしました'
    else
      redirect_to root_url, danger: 'ログアウト出来ませんでした'
    end
  end

  private

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
