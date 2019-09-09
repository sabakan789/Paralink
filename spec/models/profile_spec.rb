require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'profile' do
    before do
      user = FactoryBot.create(:user)
      @profile = Profile.new(
        profile: "test",
        userimage: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/figure_standing.png')),
        user_id: user.id
        )
    end

    describe 'profile,userimage,user_id' do
      context '全てに値が入っている場合' do
        it 'tureを返す' do
          expect(@profile).to be_valid
        end
      end
    end

    describe 'profile' do
      context '空欄の場合' do
        it 'falseを返す' do
          @profile.profile = " "
          expect(@profile).to_not be_valid
        end
      end
      context '1文字の場合' do
        it 'falseを返す' do
          @profile.profile = "a"
          expect(@profile).to be_valid
        end
      end
      context '120文字の場合' do
        it 'falseを返す' do
          @profile.profile = "a"*250
          expect(@profile).to be_valid
        end
      end
      context '121文字の場合' do
        it 'falseを返す' do
          @profile.profile = "a"*251
          expect(@profile).to_not be_valid
        end
      end
    end

    describe 'userimage' do
      context '空欄の場合' do
        it 'falseを返す' do
          @profile.userimage = " "
          expect(@profile).to_not be_valid
        end
      end
    end

    describe 'user_id' do
      context '空欄の場合' do
        it 'falseを返す' do
          @profile.user_id = " "
          expect(@profile).to_not be_valid
        end
      end
    end
  end
end
