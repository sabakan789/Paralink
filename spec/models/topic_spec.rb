require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    user = FactoryBot.create(:user)
    micropost = Micropost.create(
      content: 'test',
      user_id: user.id
    )
    @topic = Topic.new(
      description: 'test',
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/figure_standing.png')),
      micropost_id: micropost.id
    )
  end

  describe 'description,image,micropost_id' do
    context '全てに値が入っている場合' do
      it 'tureを返す' do
        expect(@topic).to be_valid
      end
    end
  end

  describe 'description' do
    context '空欄の場合' do
      it 'falseを返す' do
        @topic.description = ' '
        expect(@topic).to_not be_valid
      end
    end
    context '1文字の場合' do
      it 'falseを返す' do
        @topic.description = 'a'
        expect(@topic).to be_valid
      end
    end
    context '30文字の場合' do
      it 'falseを返す' do
        @topic.description = 'a' * 30
        expect(@topic).to be_valid
      end
    end
    context '31文字の場合' do
      it 'falseを返す' do
        @topic.description = 'a' * 31
        expect(@topic).to_not be_valid
      end
    end
  end
  describe 'description' do
    context '空欄の場合' do
      it 'falseを返す' do
        @topic.image = ' '
        expect(@topic).to_not be_valid
      end
    end
  end
  describe 'description' do
    context '空欄の場合' do
      it 'falseを返す' do
        @topic.micropost_id = ' '
        expect(@topic).to_not be_valid
      end
    end
  end
end
