require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe do
    describe 'ユーザー登録テスト' do
      context 'ユーザー新規登録した場合' do
        it '作成したタスクが表示される' do
          visit new_user_registration_path
          fill_in "user[name]", with: "test_name1"
          fill_in "user[email]", with: "test1@gmail.com"
          select 'フリー', from: "user[gender]"
          fill_in "user[age]", with: "2000"
          fill_in "user[password]", with: "test_test"
          fill_in "user[password_confirmation]", with: "test_test"
          click_on "登録"
          expect(page).to have_content 'ユーザー情報'
        end
      end
      context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
        it 'ログイン画面に遷移する' do
          visit answers_path
          expect(page).to have_content 'ログイン'
        end
      end 
    end
    describe 'セッション機能' do
      let!(:user){ FactoryBot.create(:user)}
      let!(:second_user){ FactoryBot.create(:second_user)}
      context 'ユーザーがログインする場合' do
        before do
          visit new_user_session_path
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_on "ログインする"
        end  
        it 'ログインができる' do
          expect(page).to have_content 'ユーザー情報'
        end
        it 'グループ作成画面に移管できる' do
          visit new_group_path
          expect(page).to have_content 'グループ作成'
        end
        it '今日のPOCCHIに遷移できる' do
          FactoryBot.create(:quiz)
          visit new_answer_path
          expect(page).to have_content '今日'
        end  
        it 'みんなのPOCCHIに遷移できる' do
          visit answers_path
          expect(page).to have_content 'みんな'
        end
        it 'ログアウトするとログイン画面に遷移する' do
          click_on 'ログアウト'
          expect(page).to have_content 'ログアウトしました'
        end
      end
    end   
    describe '管理画面機能' do
      context '管理ユーザがログインした場合' do
        it '質問一覧にアクセスできる' do
          FactoryBot.create(:user)
          visit new_user_session_path
          fill_in "user[email]", with: 'email1@gmail.com'
          fill_in "user[password]", with: 'password1'
          click_on "ログインする"
          visit quizzes_path
          expect(page).to have_content '質問一覧'
        end
      end
      context '一般ユーザがログインした場合' do
        let!(:second_user){FactoryBot.create(:second_user)}
        it '質問一覧にアクセスできない' do
          visit new_user_session_path
          fill_in "user[email]", with: second_user.email
          fill_in "user[password]", with: second_user.password
          click_on "ログインする"
          visit quizzes_path
          expect(current_path).to eq root_path
        end
      end
      describe '管理画面機能' do
        let!(:user){FactoryBot.create(:user)}
        let!(:second_user){FactoryBot.create(:second_user)}
        context '管理ユーザがログインした場合' do
          it '管理画面にアクセスできる' do
            visit new_user_session_path
            fill_in "user[email]", with: user.email
            fill_in "user[password]", with: user.password
            click_on "ログインする"
            click_on '管理者画面'
            expect(page).to have_content 'サイト管理'
          end
        end
      end  
    end
  end  
end  