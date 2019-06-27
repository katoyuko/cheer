require 'rails_helper'

RSpec.feature "postに関するテスト", type: :feature do
  before do
    @user1 = FactoryBot.create(:user, :create_with_posts)
    @user2 = FactoryBot.create(:user, :create_with_posts)
  end
  feature "ログインしていない状態で" do
    feature "以下のページへアクセスした際のリダイレクト先の確認" do
      scenario "投稿詳細ページ" do
        visit post_path(@user1.posts.first)
        expect(page).to have_current_path new_user_session_path
      end
    end
  end

  feature "ログインした状態で" do
    before do
      login(@user1)
    end
    feature "表示内容とリンクの確認" do
      scenario "投稿一覧ページの表示内容とリンクは正しいか" do
        visit posts_path
        posts = Post.all
        posts.each do |post|
          expect(page).to have_link post.user,href: user_path(post.user)
        end
        # ユーザー名が表示されているか
        expect(page).to have_content @user1.name
      end

      scenario "自分の投稿詳細ページでの表示内容とリンクは正しいか" do
        post = @user1.posts.first
        visit post_path(post)
        expect(page).to have_content post.post_category
        expect(page).to have_content post.post_content
        expect(page).to have_link "> 投稿編集",href: edit_post_path(post)
        expect(page).to have_content @user1.name
        expect(page).to have_link @user1.name,href: user_path(@user1)
      end

      scenario "他人の投稿詳細ページでの表示内容とリンクは正しいか" do
        post = @user2.posts.first
        visit post_path(post)
        expect(page).to have_content post.post_category
        expect(page).to have_content post.post_content
        expect(page).to_not have_link "> 投稿編集",href: edit_post_path(post)
        expect(page).to have_link @user2.name,href: user_path(@user2)
        expect(page).to have_content @user2.name
      end
    end
  end
end