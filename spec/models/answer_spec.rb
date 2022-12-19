require 'rails_helper'
RSpec.describe Answer, type: :model do
  describe 'バリデーションのテスト' do
    let!(:user){ FactoryBot.create(:user)}
    let!(:group){ FactoryBot.create(:group)} 
    let!(:quiz){ FactoryBot.create(:quiz)}
    context '解答が空の場合' do
      it 'バリデーションに引っかかる' do
        answer = Answer.new(quiz_id: quiz.id, group_id: group.id, user_id: user.id, select_answer: '')
        expect(answer).not_to be_valid
      end
    end
    context '全項目が入力されている場合' do
      it '登録が完了する' do
        answer = Answer.new(quiz_id: quiz.id, group_id: group.id, user_id: user.id, select_answer: "A", created_at:'2022/12/18', updated_at: '2022/12/18')  
        expect(answer).to be_valid
      end
    end
  end
end