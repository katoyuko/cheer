require 'rails_helper'
require "refile/file_double"

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
      it "userとcategoryを入れて保存" do
        user = FactoryBot.create(:user)
        category_image = Refile::FileDouble.new("dummy", "category.png", content_type: "image/png")
        post_category = FactoryBot.create(:post_category, category_image: category_image)
        expect(FactoryBot.create(:post, user: user, post_category: post_category)).to be_valid
      end
    end
    context "保存できない場合" do
      it "userを保存していない" do
        expect(FactoryBot.build(:post)).to_not be_valid
      end
      it "post_contentが空欄" do
        expect(FactoryBot.build(:post, :no_post_content)).to_not be_valid
      end
    end
  end
end

