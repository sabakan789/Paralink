require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user = User.create(
      name: 'TEST_USER',
      email: 'test@example.com',
      password: 'password1234'
    )
  end
  it '新規登録する' do
    visit root_path
    visit new_user_path
    fill_in 'user_name', with: '太郎'
    fill_in 'user_email', with: 'tarou@example.com'
    fill_in 'user_password', with: 'tarou1234'
    fill_in 'user_password_confirmation', with: 'tarou1234'

    click_on '登録'
    expect(page).to have_selector '.alert', text: '登録に成功しました'
  end
  it 'ログインする' do
    visit root_path
    visit login_path
    fill_in 'sesstion_email', with: 'test@example.com'
    fill_in 'sesstion_password', with: 'password1234'
    click_on 'ログインする'
    expect(page).to have_selector '.alert', text: 'ログインしました'
  end
end
