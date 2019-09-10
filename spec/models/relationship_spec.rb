require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user = FactoryBot.create(:user)
    @relationship = Relationship.new(
      following_id: user.id,
      follower_id: user.id
    )
  end

  describe 'following_id,follower_id' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@relationship.save).to be_truthy
      end
    end
  end

  describe 'following_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @relationship.following_id = ' '
        expect(@relationship.save).to be_falsey
      end
    end
  end
  describe 'follower_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @relationship.follower_id = ' '
        expect(@relationship.save).to be_falsey
      end
    end
  end
end
