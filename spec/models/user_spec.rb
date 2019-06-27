require 'rails_helper'
require "refile/file_double"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Postモデルを多数持っている" do
      is_expected.to have_many(:posts)
    end
  end

  describe '実際に保存してみる' do
    context "保存できない場合" do
      it "nameが41文字以上" do
        expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
      end

      it "introductionが201文字以上" do
        expect(FactoryBot.build(:user, :too_long_introduction)).to_not be_valid
      end
    end
  end
end