require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    micropost = Micropost.create(
      content: 'test',
      user_id: user.id
    )
    @comment = Comment.new(
      comment: 'test',
      user_id: user.id,
      micropost_id: micropost.id
    )
  end

  describe 'comment,user_id,micropost_id' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@comment).to be_valid
      end
    end
  end

  describe 'comment' do
    context '空欄の場合' do
      it 'falseを返す' do
        @comment.comment = ' '
        expect(@comment).to_not be_valid
      end
    end
    context '1文字の場合' do
      it 'tureを返す' do
        @comment.comment = 'a'
        expect(@comment).to be_valid
      end
    end
    context '120文字の場合' do
      it 'tureを返す' do
        @comment.comment = 'a' * 120
        expect(@comment).to be_valid
      end
    end
    context '121文字の場合' do
      it 'falseを返す' do
        @comment.comment = 'a' * 121
        expect(@comment).to_not be_valid
      end
    end
  end
  describe 'user_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @comment.user_id = ' '
        expect(@comment).to_not be_valid
      end
    end
  end
  describe 'micropost_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        @comment.micropost_id = ' '
        expect(@comment).to_not be_valid
      end
    end
  end
end
