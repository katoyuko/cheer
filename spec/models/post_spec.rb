require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
  end

  describe 'アソシエーション' do
    it "Post_categoryモデルに属している" do
      is_expected.to belong_to(:post_category)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "user_idを入れて保存" do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:post, user_id: user.id)).to be_valid
      end
    end
    context "保存できない場合" do
      it "user_idを保存していない" do
        expect(FactoryBot.build(:post)).to_not be_valid
      end
      it "post_contentが空欄" do
        expect(FactoryBot.build(:post, :no_post_content)).to_not be_valid
      end
      it "post_contentが141文字以上" do
        expect(FactoryBot.build(:post, :too_long_post_content)).to_not be_valid
      end
    end
  end
end

