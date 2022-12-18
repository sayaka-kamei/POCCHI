require 'rails_helper'
RSpec.describe 'クイズ管理機能', type: :system do
  describe do
    describe 'quiz登録テスト' do
      let!(:user){ FactoryBot.create(:user)}
      context 'クイズを新規登録した場合' do
        it 'クイズ詳細に移管する' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_quiz_path
          fill_in "quiz[title]", with: "元気ですか〜？"
          fill_in "quiz[image]", with: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/pocchi1.png'))
          select "2022/12/18", from: "request_answer_on"
          click_on "登録する"
          expect(page).to have_content '作成しました'
        end
      end
    end
    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成済みの質問一覧が表示される' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_quiz_path
          fill_in "quiz[title]", with: "元気ですか〜？"
          fill_in "quiz[image]", with: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/pocchi1.png'))
          select "2022/12/18", from: "request_answer_on"
          click_on "登録する"
          visit quizzes_path
          expect(page).to have_content '元気ですか〜？'
        end
      end
    end  
  end
end