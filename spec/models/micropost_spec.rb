require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    user = FactoryBot.create(:user)
    @micropost = Micropost.new(
      content: "test",
      user_id: user.id
      )
  end

  describe 'content,user_id' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@micropost).to be_valid
      end
    end
  end

  describe 'contentのバリデーション' do
    context '空欄の場合' do
      it 'falseを返す' do
        @micropost.content = " "
        expect(@micropost).to_not be_valid
      end
    end
    context '1文字の場合' do
      it 'tureを返す' do
        @micropost.content = "a"
        expect(@micropost).to be_valid
      end
    end
    context '120文字の場合' do
      it 'tureを返す' do
        @micropost.content = "a"*200
        expect(@micropost).to be_valid
      end
    end
    context '121文字の場合' do
      it 'falseを返す' do
        @micropost.content = "a"*201
        expect(@micropost).to_not be_valid
      end
    end
  end

  describe 'user_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @micropost.user_id = " "
        expect(@micropost).to_not be_valid
      end
    end
  end
end
