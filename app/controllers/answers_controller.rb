class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @q = Answer.ransack(params[:q])
    @answers = @q.result(distinct: true)
    @answers = @answers.where(group_id: current_user.groups.pluck(:id)).order(updated_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(answer_id: @answer.id)
  end

  def new
    @today_quiz = Quiz.find_by(request_answer_on: Date.current) 
    @answer = Answer.new
    # @quiz = Quiz.offset( rand(Quiz.count) ).first
  end

  def edit
  end

  def create
    @today_quiz = Quiz.find_by(request_answer_on: Date.current) 
    @answer = current_user.answers.build(answer_params)
    @answer.group_id = answer_params[:group_id]
    @answer.quiz_id = answer_params[:quiz_id]
    if @answer.save
      AnswerMailer.answer_mail(@answer).deliver
      redirect_to @answer, notice: '解答をグループの皆さんへメールしました'
    else
      render 'new'
    end    
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: '解答をグループの皆さんへメールしました。'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: '解答を削除しました。'
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:select_answer, :quiz_id, :user_id, :group_id)
    end
end
