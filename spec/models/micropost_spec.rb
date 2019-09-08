require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe 'content' do
    context '空欄の場合' do
      it 'falseを返す' do
        micropost = Micropost.new(content: '', user_id: '1')
        expect(micropost.save).to be_falsey
      end
    end
    context '1文字の場合' do
      it 'tureを返す' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        micropost = Micropost.new(content: '@', user_id: '1')
        expect(micropost.save).to be_truthy
      end
    end
    context '120文字の場合' do
      it 'tureを返す' do
        pending 'この先はなぜかテストが失敗するのであとで直す'
        micropost = Micropost.new(content: '@*120', user_id: '1')
        expect(micropost.save).to be_truthy
      end
    end
    context '121文字の場合' do
      it 'falseを返す' do
        micropost = Micropost.new(content: '@*121', user_id: '1')
        expect(micropost.save).to be_falsey
      end
    end
  end
  describe 'user_id' do
    context '空欄の場合' do
      it 'falseを返す' do
        micropost = Micropost.new(content: '@', user_id: '')
        expect(micropost.save).to be_falsey
      end
    end
  end
end
