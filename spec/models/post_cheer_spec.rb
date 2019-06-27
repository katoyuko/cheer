require 'rails_helper'

RSpec.describe PostCheer, type: :model do
  describe 'アソシエーション' do
    it "Postモデルに属している" do
      is_expected.to belong_to(:post)
    end
  end

  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる" do
      it "cheerを保存" do
        user = FactoryBot.create(:user)
        category_image = Refile::FileDouble.new("dummy", "category.png", content_type: "image/png")
        post_category = FactoryBot.create(:post_category, category_image: category_image)
        post = FactoryBot.create(:post, user: user, post_category: post_category)
        expect(FactoryBot.create(:post_cheer, user: user, post: post)).to be_valid
      end
    end
  end
end
