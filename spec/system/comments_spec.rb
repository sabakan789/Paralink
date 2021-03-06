require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Comments', type: :system do
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
  it 'コメントする', js: true do
    visit microposts_path
    click_on 'test'
    fill_in 'user_new_comment', with: 'test_comment'
    click_button 'コメントをする'
    expect(page).to have_content 'test_comment'
  end
end
