require 'rails_helper'

RSpec.describe FavoriteCategory, type: :model do

  describe 'アソシエーション' do
    it "post_categoryモデルに属している" do
      is_expected.to belong_to(:post_category)
    end
  end

  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる" do
      it "favorite_categoryを保存" do
        user = FactoryBot.create(:user)
        category_image = Refile::FileDouble.new("dummy", "category.png", content_type: "image/png")
        post_category = FactoryBot.create(:post_category, category_image: category_image)
        expect(FactoryBot.create(:favorite_category, user: user, post_category: post_category)).to be_valid
      end
    end
  end
end
