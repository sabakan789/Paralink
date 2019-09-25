require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '未ログイン状態' do
    context 'GET #new の場合' do
      it 'ルートページへ遷移する' do
        get :new, params: { user_id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'POST #create の場合' do
      it 'ルートページへ遷移する' do
        post :create, params: { user_id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'GET #edit の場合' do
      it 'ルートページへ遷移する' do
        get :edit, params: { user_id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'PATCH #update の場合' do
      it 'ルートページへ遷移する' do
        patch :update, params: { user_id: @user.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
  end
end
