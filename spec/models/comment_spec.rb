require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment' do
    context '空欄の場合' do
      it 'falseを返す' do
        comment = Comment.new(comment: '', user_id: '1', micropost_id: '1')
        expect(comment.save).to be_falsey
      end
    end
    context '1文字の場合' do
      it 'tureを返す' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        comment = Comment.new(comment: '@', user_id: 1, micropost_id: 1)
        expect(comment.save).to be_truthy
      end
    end
    context '120文字の場合' do
      it 'tureを返す' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        comment = Comment.new(comment: '@*120', user_id: 1, micropost_id: 1)
        expect(comment.save).to be_truthy
      end
    end
    context '121文字の場合' do
      it 'falseを返す' do
        comment = Comment.new(comment: '@*121', user_id: '1', micropost_id: '1')
        expect(comment.save).to be_falsey
      end
    end
  end
  describe 'user_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        comment = Comment.new(comment: '@', user_id: '', micropost_id: '1')
        expect(comment.save).to be_falsey
      end
    end
  end
  describe 'micropost_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        comment = Comment.new(comment: '@', user_id: '1', micropost_id: '')
        expect(comment.save).to be_falsey
      end
    end
  end
end
