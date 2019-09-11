require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  # before do
  #   @user = FactoryBot.create(:user)
  # end
  # describe 'POST #create' do
  #   context 'email,passwordが正しい場合' do
  #     it 'ログインする' do
  #       post :create, session: { email: @user.email, password: @user.password }
  #       expect(response).to redirect_to root_path
  #       expect(flash[:success]).to match("ログインしました")
  #     end
  #   end
  #   context 'emailが違う場合' do
  #     it 'Errorになる' do
  #       post :create, session: { email: 'test', password: @user.password }
  #       expect(response).to render_template(:new)
  #       expect(flash[:danger]).to match("ログインに失敗しました")
  #     end
  #   end
  #   context 'passwordが違う場合' do
  #     it 'Errorになる' do
  #       post :create, session: { email: @user.email, password: 'test' }
  #       expect(response).to render_template(:new)
  #       expect(flash[:danger]).to match("ログインに失敗しました")
  #     end
  #   end
  # end
end
