require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @comment = FactoryBot.create(:comment)
  end

  describe '未ログイン状態' do
    context 'POST #create の場合' do
      it 'ルートページへ遷移する' do
        post :create, params: { micropost_id: @comment.micropost.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
    context 'DELETE #destroy の場合' do
      it 'ルートページへ遷移する' do
        delete :destroy, params: { micropost_id: @comment.micropost.id }
        expect(response.status).to_not eq '200'
        expect(response).to redirect_to root_path
      end
    end
  end
end
