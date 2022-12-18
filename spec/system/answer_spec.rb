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
          click_on "質問一覧"
          find('#rspec1').click
          fill_in "quiz[title]", with: "元気ですか〜？"
          attach_file "quiz[image]", File.join(Rails.root, 'spec/factories/images/pocchi1.png')
          sleep(1)
          fill_in "quiz[request_answer_on]",  with: Date.new(2022, 12, 1)
          click_on "登録する"
          sleep(1)
          click_on "今日のPOCCHI"
          select "test_group",from: "answer[group_id]"
          find('label[for=A]').click
          click_on "今日の解答する"
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
          click_on "質問一覧"
          find('#rspec1').click
          fill_in "quiz[title]", with: "元気ですか〜？"
          attach_file "quiz[image]", File.join(Rails.root, 'spec/factories/images/pocchi1.png')
          sleep(1)
          fill_in "quiz[request_answer_on]",  with: Date.new(2022, 12, 1)
          click_on "登録する"
          sleep(1)
          click_on "今日のPOCCHI"
          select "test_group",from: "answer[group_id]"
          find('label[for=A]').click
          click_on "今日の解答する"
          click_on "一覧へもどる"
          expect(page).to have_content '元気ですか〜？'
        end
      end
    end  
  end
end