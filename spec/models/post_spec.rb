require 'rails_helper'

RSpec.describe Post, type: :model do

  context "データが正しく保存される" do
    # テスト用のデータを作成
    before do
      @post = Post.new
      @post.post_content = "今日もここまで頑張りました！"
      @post.save
    end
    # @postに正しくデータが保存されているかを確認
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end

end

