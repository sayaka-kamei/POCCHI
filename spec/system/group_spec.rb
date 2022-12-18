require 'rails_helper'
RSpec.describe 'グループ管理機能', type: :system do
  describe do
    describe 'グループ登録テスト' do
      let!(:user){ FactoryBot.create(:user)}
      context 'グループを新規登録した場合' do
        it 'ユーザー情報に移管する' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_group_path
          fill_in "group[name]", with: "test_group"
          click_on "登録する"
          expect(page).to have_content '作成しました'
        end
      end
    end
  end
end