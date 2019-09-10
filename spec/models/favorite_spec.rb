require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    user = FactoryBot.create(:user)
    micropost = Micropost.create(
      content: 'test',
      user_id: user.id
    )
    @favorite = Favorite.new(
      user_id: user.id,
      micropost_id: micropost.id
    )
  end

  describe 'user_id,micropost_id' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@favorite.save).to be_truthy
      end
    end
  end

  describe 'user_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @favorite.user_id = ' '
        expect(@favorite.save).to be_falsey
      end
    end
  end

  describe 'micropost_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @favorite.micropost_id = ' '
        expect(@favorite.save).to be_falsey
      end
    end
  end
end
