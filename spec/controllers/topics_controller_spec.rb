require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  before do
    @topic = FactoryBot.create(:topic)
  end

  describe '未ログイン状態' do
    context 'GET #new の場合' do
      it 'ルートページへ遷移する' do
        get :new, params: { micropost_id: @topic.micropost.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'POST #create の場合' do
      it 'ルートページへ遷移する' do
        post :create, params: { micropost_id: @topic.micropost.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'DELETE #destroy の場合' do
      it 'ルートページへ遷移する' do
        delete :destroy, params: { id: @topic.id, micropost_id: @topic.micropost.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
  end
end
