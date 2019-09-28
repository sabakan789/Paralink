require 'rails_helper'

RSpec.feature 'Microposts', type: :system do
  before do
    @user = User.create(
      name: 'TEST_USER',
      email: 'test@example.com',
      password: 'password1234'
    )
    visit root_path
    visit login_path
    fill_in 'sesstion_email', with: 'test@example.com'
    fill_in 'sesstion_password', with: 'password1234'
    click_on 'ログインする'
    @micropost = Micropost.create(
      content: 'test',
      user_id: @user.id
    )
  end
  it '投稿する' do
    expect do
      visit new_micropost_path
      fill_in 'user_new_micropost', with: 'TEST'
      click_on '投稿する'
      expect(page).to have_selector '.alert', text: '投稿しました'
      expect(page).to have_content 'TEST'
    end.to change(@user.microposts, :count).by(1)
  end
end
