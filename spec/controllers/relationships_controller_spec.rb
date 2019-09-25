require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'POST #create の場合' do
    it 'ルートページへ遷移する' do
      post :create, params: { user_id: @user.id }
      expect(response.status).to_not eq '200'
      expect(response).to redirect_to root_path
    end
  end
  context 'DELETE #destroy の場合' do
    it 'ルートページへ遷移する' do
      delete :destroy, params: { user_id: @user.id }
      expect(response.status).to_not eq '200'
      expect(response).to redirect_to root_path
    end
  end
end
