require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  describe '実際に保存してみる' do
    context "保存できる" do
      it "categoryとcategory_imageを保存" do
        category_image = Refile::FileDouble.new("dummy", "category.png", content_type: "image/png")
        expect(FactoryBot.create(:post_category, category_image: category_image)).to be_valid
      end
    end
  end
end