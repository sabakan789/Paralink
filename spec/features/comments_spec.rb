require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
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
  it 'コメントする' do
    visit microposts_path
    click_on 'test'
    click_on 'コメントする'
    fill_in 'コメント内容', with: 'test_comment'
    click_on 'コメントする'
    expect(page).to have_content 'コメントに成功しました'
    expect(page).to have_content 'test_comment'
  end
end
