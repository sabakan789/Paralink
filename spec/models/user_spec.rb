require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'nameのバリデーション' do
    let(:user){User.new(name:                     name,
                        email:                   'test_name@example.com',
                        password:                'password1234',
                        password_confirmation:   'password1234') }
    subject { user }
    context '空白の場合' do
      let(:name) { ' ' }
      it { is_expected.to_not be_valid }
    end
    context '1文字の場合' do
      let(:name) { '@' }
      it { is_expected.to be_valid }
    end
    context '15文字の場合' do
      let(:name) { '@' * 15 }
      it { is_expected.to be_valid }
    end
    context '16文字の場合' do
      let(:name) { '@' * 16 }
      it { is_expected.to_not be_valid }
    end
    context 'nameが重複していた場合' do
      let!(:name_user){create(:user, name: 'test_name',email: 'name@example.com')}
      let(:name) { 'test_name' }
      it { is_expected.to_not be_valid }
    end
  end

  describe 'emailのバリデーション' do
    let(:user){User.new(name:                    'test_email',
                        email:                    email,
                        password:                'password1234',
                        password_confirmation:   'password1234') }
    subject { user }
    context '空白の場合' do
      let(:email) { ' ' }
      it { is_expected.to_not be_valid }
    end
    context '「@」「.」がない場合' do
      let(:email) { 'testtestcom' }
      it { is_expected.to_not be_valid }
    end
    context '「.」がない場合' do
      let(:email) { 'test@testcom' }
      it { is_expected.to_not be_valid }
    end
    context '「@」がない場合' do
      let(:email) { 'testtest.com' }
      it { is_expected.to_not be_valid }
    end
    context '「.」が「,」の場合' do
      let(:email) { 'test@test,com' }
      it { is_expected.to_not be_valid }
    end
    context '「.」が「@」の場合' do
      let(:email) { 'test@test@com' }
      it { is_expected.to_not be_valid }
    end
    context '「@」が「.」の場合' do
      let(:email) { 'test@test@com' }
      it { is_expected.to_not be_valid }
    end
    context 'emailが重複していた場合' do
      let!(:email_user){create(:user, name: 'test_email', email: 'test_email@example.com')}
      let(:email) { 'test_email@example.com' }
      it { is_expected.to_not be_valid }
    end
  end

  describe 'passwordのバリデーション' do
    let(:user){User.new(name:                    'test_name',
                        email:                   'test@example.com',
                        password:                 password,
                        password_confirmation:    password) }
    subject { user }
    context 'アルファベットのみの場合' do
      let(:password) { 'a' * 10 }
      it { is_expected.to_not be_valid }
    end
    context '数字のみ場合' do
      let(:password) { '1' * 10 }
      it { is_expected.to_not be_valid }
    end
    context '7文字の場合' do
      let(:password) { '1' * 3 + 'a' * 4 }
      it { is_expected.to_not be_valid }
    end
    context '8文字の場合' do
      let(:password) { '1' * 4 + 'a' * 4 }
      it { is_expected.to be_valid }
    end
    context '32文字の場合' do
      let(:password) { '1' * 16 + 'a' * 16 }
      it { is_expected.to be_valid }
    end
    context '33文字の場合' do
      let(:password) { '1' * 16 + 'a' * 17 }
      it { is_expected.to_not be_valid }
    end
  end
end
