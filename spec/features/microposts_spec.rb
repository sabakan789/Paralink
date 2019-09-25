require 'rails_helper'

RSpec.feature 'Microposts', type: :feature do
  before do
    @user = User.create(
      name: 'TEST_USER',
      email: 'test@example.com',
      password: 'password1234'
    )
    visit root_path
    visit login_path
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password1234'
    click_on 'ログインする'
    @micropost = Micropost.create(
      content: 'test',
      user_id: @user.id
    )
  end
  it '投稿する' do
    expect do
      visit new_micropost_path
      fill_in '投稿内容', with: 'TEST'
      click_on '投稿する'
      expect(page).to have_content '投稿しました'
      expect(page).to have_content 'TEST'
    end.to change(@user.microposts, :count).by(1)
  end
end
