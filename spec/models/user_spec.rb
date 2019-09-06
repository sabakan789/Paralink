require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name' do
    context '15文字の場合' do
      it 'tureを返す' do
        user = User.new(name: 'aaaaaaaaaaaaaaa', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to be_truthy
      end
    end
    context '16文字以上の場合' do
      it 'falseを返す' do
        user = User.new(name: 'aaaaaaaaaaaaaaaa', email: 'aaa@aaa.jp', password: 'example789', password_confirmation: 'example789')
        expect(user.save).to_not be_truthy
      end
    end
  end
end
