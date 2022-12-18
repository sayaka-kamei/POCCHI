require 'rails_helper'
RSpec.describe 'アンサー管理機能', type: :system do
  describe do
    describe 'アンサー登録テスト' do
      let!(:user){ FactoryBot.create(:user)}
      context 'アンサーを新規登録した場合' do
        it 'アンサー詳細に移管する' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_group_path
          fill_in "group[name]", with: "test_group"
          click_on "登録する"
          visit new_quiz_path
          fill_in "quiz[title]", with: "元気ですか〜？"
          fill_in "quiz[image]", with: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/pocchi1.png'))
          select "2022/12/18", from: "request_answer_on"
          click_on "登録する"
          select "test_group",from: "answer[group_id]"
          find('label[for=A]').click
          visit answer_path
          expect(page).to have_content 'メールしました'
        end
      end
    end
    describe '一覧表示機能' do
      let!(:user){ FactoryBot.create(:user)}  
      context '一覧画面に遷移した場合' do
        it '解答済みのアンサー一覧が表示される' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_group_path
          fill_in "group[name]", with: "test_group"
          click_on "登録する"
          visit new_quiz_path
          fill_in "quiz[title]", with: "元気ですか〜？"
          fill_in "quiz[image]", with: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/pocchi1.png'))
          select "2022/12/18", from: "request_answer_on"
          click_on "登録する"
          select "test_group",from: "answer[group_id]"
          find('label[for=A]').click
          visit answer_path
          click_on "解答する"
          click_on "一覧へもどる"
          expect(page).to have_content '元気ですか〜？'
        end
      end
    end  
  end
end