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
          click_on "質問一覧"
          find('#rspec1').click
          fill_in "quiz[title]", with: "元気ですか〜？"
          attach_file "quiz[image]", File.join(Rails.root, 'spec/factories/images/pocchi1.png')
          sleep(1)
          fill_in "quiz[request_answer_on]",  with: Date.current
          click_on "登録する"
          sleep(1)
          expect(page).to have_content '作成しました'
        end
      end
    end
    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        let!(:user){ FactoryBot.create(:user)}
        it '作成済みの質問一覧が表示される' do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
          visit new_quiz_path
          fill_in "quiz[title]", with: "元気ですか〜？"
          attach_file "quiz[image]", File.join(Rails.root, 'spec/factories/images/pocchi1.png')
          sleep(1)
          fill_in "quiz[request_answer_on]",  with: Date.current
          click_on "登録する"
          sleep(1)
          find('#rspec3').click
          expect(page).to have_content '元気ですか〜？'
        end
      end
    end  
  end
end
