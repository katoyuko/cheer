require 'rails_helper'


  # PostsControllerをテスト対象とする
RSpec.describe PostsController, type: :controller do

  # 新規投稿ページの関するテスト
  describe "新規投稿ページ" do
    context "新規投稿ページが正しく表示される" do
  # 新規投稿ページを表示する処理をitの前に行う
      before do
        get :new
      end
      it "returns http success (200 OKとなること)" do
        expect(response.status).to eq 200
      end
      render_views
      it "タイトルが正しく表示されていること" do
        expect(response.body).to include("New post")
      end
    end
  end

  # 投稿一覧ページの関するテスト
  describe "投稿一覧ページ" do
    context "投稿一覧ページが正しく表示される" do
      before do
        get :index
      end
      it "returns http success (200 OKとなること)" do
        expect(response.status).to eq 200
      end
    end
  end

  # 投稿詳細ページの関するテスト
  describe "投稿詳細ページ" do
    context "投稿詳細ページが正しく表示される" do
      before do
        get :show
      end
      it "returns http success (200 OKとなること)" do
        expect(response.status).to eq 200
      end
    end
  end

  # 投稿編集ページの関するテスト
  describe "投稿編集ページ" do
    context "投稿編集ページが正しく表示される" do
      before do
        get :edit
      end
      it "returns http success (200 OKとなること)" do
        expect(response.status).to eq 200
      end
    end
  end



end
