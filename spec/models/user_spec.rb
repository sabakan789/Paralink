require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'name,email,password,password_confirmation' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@user).to be_valid
      end
    end
  end

  describe 'nameのバリデーション' do
    context '空白の場合' do
      it 'falseを返す' do
        @user.name = ' '
        expect(@user).to_not be_valid
      end
    end
    context '1文字の場合' do
      it 'tureを返す' do
        @user.name = '@'
        expect(@user).to be_valid
      end
    end
    context '15文字の場合' do
      it 'tureを返す' do
        @user.name = '@' * 15
        expect(@user).to be_valid
      end
    end
    context '16文字の場合' do
      it 'falseを返す' do
        @user.name = '@' * 16
        expect(@user).to_not be_valid
      end
    end
    context 'nameが重複していた場合' do
      it 'falseを返す' do
        FactoryBot.create(:user, name: 'test')
        @user.name = 'test'
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'emailのバリデーション' do
    context '空白の場合' do
      it 'falseを返す' do
        @user.email = ' '
        expect(@user).to_not be_valid
      end
    end
    context 'emailが正規表現と違う場合' do
      it 'falseを返す' do
        expect(FactoryBot.build(:user, email: 'testtestcom')).to_not be_valid

        expect(FactoryBot.build(:user, email: 'test@testcom')).to_not be_valid

        expect(FactoryBot.build(:user, email: 'testtest.com')).to_not be_valid

        expect(FactoryBot.build(:user, email: 'test@test,com')).to_not be_valid

        expect(FactoryBot.build(:user, email: 'test@test@com')).to_not be_valid

        expect(FactoryBot.build(:user, email: 'test.test.com')).to_not be_valid
      end
    end
    context 'emailが重複していた場合' do
      it 'falseを返す' do
        FactoryBot.create(:user, email: 'test@test.com')
        @user.email = 'test@test.com'
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'passwordのバリデーション' do
    context 'アルファベットのみの場合' do
      it 'falseを返す' do
        @user.password = @user.password_confirmation = 'a' * 10
        expect(@user).to_not be_valid
      end
    end
    context '数字のみ場合' do
      it 'falseを返す' do
        @user.password = @user.password_confirmation = '1' * 10
        expect(@user).to_not be_valid
      end
    end
    context '7文字の場合' do
      it 'falseを返す' do
        @user.password = @user.password_confirmation = '1' * 3 + 'a' * 4
        expect(@user).to_not be_valid
      end
    end
    context '8文字の場合' do
      it 'tureを返す' do
        @user.password = @user.password_confirmation = '1' * 4 + 'a' * 4
        expect(@user).to be_valid
      end
    end
    context '32文字の場合' do
      it 'tureを返す' do
        @user.password = @user.password_confirmation = '1' * 16 + 'a' * 16
        expect(@user).to be_valid
      end
    end
    context '33文字の場合' do
      it 'turを返す' do
        @user.password = @user.password_confirmation = '1' * 16 + 'a' * 17
        expect(@user).to_not be_valid
      end
    end
  end
end