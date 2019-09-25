require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  # describe 'GET #new' do
  #   render_views
  #   it 'リクエストが成功する' do
  #     get :new
  #     expect(response.status).to eq 200
  #   end
  #   it 'newテンプレートで表示される' do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  #   it 'h1に"新規登録"という記述がある' do
  #     get :new
  #     expect(response.body).to include "新規登録"
  #   end
  # end

  describe '未ログイン状態' do
    context 'GET #search の場合' do
      it 'ルートページへ遷移する' do
        get :search
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #index の場合' do
      it 'ルートページへ遷移する' do
        get :index
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #show の場合' do
      it 'ルートページへ遷移する' do
        get :show, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #edit の場合' do
      it 'ルートページへ遷移する' do
        get :edit, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #update の場合' do
      it 'ルートページへ遷移する' do
        get :update, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #follows の場合' do
      it 'ルートページへ遷移する' do
        get :follows, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #followers の場合' do
      it 'ルートページへ遷移する' do
        get :followers, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #destroy の場合' do
      it 'ルートページへ遷移する' do
        get :destroy, params: { id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
  end
end
