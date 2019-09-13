require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user = User.create(
      name: 'TEST_USER',
      email: 'test@example.com',
      password: 'password1234',
    )
  end
  it '新規登録する' do
    visit root_path
    visit new_user_path
    fill_in '名前', with: '太郎'
    fill_in 'メールアドレス', with: 'tarou@example.com'
    fill_in 'パスワード', with: 'tarou1234'
    fill_in 'パスワード（確認）', with: 'tarou1234'
    click_on '登録'
    expect(page).to have_content '登録に成功しました'
  end
  it 'ログインする' do
    visit root_path
    visit login_path
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password1234'
    click_on 'ログインする'
    expect(page).to have_content 'ログインしました'
  end
end
