require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name' do
    context '15文字の場合' do
      it 'tureを返す' do
        user = User.new(name: 'aaaaaaaaaaaaaaa', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_truthy
      end
    end
    context '16文字の場合' do
      it 'falseを返す' do
        user = User.new(name: 'aaaaaaaaaaaaaaaa', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to_not be_truthy
      end
    end
    context '保存するnameと同じnameがあった場合' do
      it 'falseを返す' do
        user1 = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        user1.save
        user2 = User.new(name: 'sample', email: 'bbb@bbb.jp', password: 'example789', password_confirmation: 'example789')
        expect(user2.save).to be_falsey
      end
    end
    context '保存するnameが無かった場合' do
      it 'tureを返す' do
        user1 = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        user1.save
        user2 = User.new(name: 'samplesample', email: 'bbb@bbb.jp', password: 'example789', password_confirmation: 'example789')
        expect(user2.save).to be_truthy
      end
    end
    context 'nameが空欄の場合' do
      it 'falseを返す' do
        user = User.new(name: '', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_falsey
      end
    end
    context 'nameが1文字の場合' do
      it 'tureを返す' do
        user = User.new(name: '@', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_truthy
      end
    end
  end

  describe 'email' do
    context 'emailが空欄の場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: '', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_falsey
      end
    end
    context 'emailに@/.があった場合' do
      it 'tureを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_truthy
      end
    end
    context '保存するemailと同じemailがあった場合' do
      it 'falseを返す' do
        user1 = User.new(name: 'sample1', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        user1.save
        user2 = User.new(name: 'sample2', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user2.save).to be_falsey
      end
    end
    context '保存するemailが無かった場合' do
      it 'tureを返す' do
        user1 = User.new(name: 'sample1', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        user1.save
        user2 = User.new(name: 'sample2', email: 'bbb@bbb.jp', password: 'example789', password_confirmation: 'example789')
        expect(user2.save).to be_truthy
      end
    end
    context 'emailに@が無かった場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: 'aaaaaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_falsey
      end
    end
    context 'emailに.が無かった場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaajp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_falsey
      end
    end
  end

  describe 'password' do
    context 'アルファベットと数字を最低1文字使用した場合' do
      it 'tureを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_truthy
      end
    end
    context 'アルファベットのみの場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'exampleexample', password_confirmation: 'exampleexample')
        expect(user.save).to be_falsey
      end
    end
    context '数字のみ場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: '123456789', password_confirmation: '123456789')
        expect(user.save).to be_falsey
      end
    end
    context '7文字の場合' do
      it 'tureを返す' do
        user2 = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'abcd123', password_confirmation: 'abcd123')
        expect(user2.save).to be_falsey
      end
    end
    context '8文字の場合' do
      it 'falseを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'abcd1234', password_confirmation: 'abcd1234')
        expect(user.save).to be_truthy
      end
    end
    context '32文字の場合' do
      it 'tureを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'abcdefghijklmnopqrstuvwxyz123456', password_confirmation: 'abcdefghijklmnopqrstuvwxyz123456')
        expect(user.save).to be_truthy
      end
    end
    context '33文字の場合' do
      it 'turを返す' do
        user = User.new(name: 'sample', email: 'aaa@aaa.jp', password: 'abcdefghijklmnopqrstuvwxyz1234567', password_confirmation: 'abcdefghijklmnopqrstuvwxyz1234567')
        expect(user.save).to be_falsey
      end
    end
  end
end
