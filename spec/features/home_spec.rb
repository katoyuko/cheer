require 'rails_helper'
# config.active_support.deprecation = :silenceをconfigのtest.rbに付け加える必要がある
RSpec.feature "Home、signup、signin、logoutに関するテスト", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  feature "サインアップの確認" do
    # テスト用のデータを作成
    before do
      visit new_user_registration_path
      find_field('user[name]').set("name")
      find_field('user[email]').set("name@mail.com")
      find_field('user[password]').set("password")
      find_field('user[password_confirmation]').set("password")
    end

    # featureではitの代わりにscenarioを使用
    scenario "正しくサインアップできているか" do
      expect {
        find("input[name='commit']").click
      }.to change(User, :count).by(1)
    end
    scenario "サクセスメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "＼Welcome／"
    end
  end

  feature "有効でない内容でのサインアップの確認" do
    before do
      visit new_user_registration_path
      find_field('user[name]').set(nil)
      find_field('user[email]').set("name@mail.com")
      find_field('user[password]').set("password")
      find_field('user[password_confirmation]').set("password")
      find("input[name='commit']").click
    end
  end

  feature "ログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[password]').set(@user.password)
      find("input[name='commit']").click
    end
  end

  feature "有効でない内容でのログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[password]').set(nil)
      find("input[name='commit']").click
    end
    scenario "リダイレクト先は正しいか" do
      expect(page).to have_current_path new_user_session_path
    end
  end

  feature "ログアウトの確認" do
    before do
      login(@user)
      visit user_path(@user)
      all("a[data-method='delete'][href='/users/sign_out']")[0].click
     # click_on "logout"
    end
    scenario "正しくログアウトして、リダイレクトされているか" do
      expect(page).to have_current_path "/"
    end
    scenario "サクセスメッセージは正しく表示されるか" do
      expect(page).to have_content "ログアウトしました！"
    end
  end

end
