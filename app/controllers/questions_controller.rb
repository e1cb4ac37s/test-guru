class QuestionsController < ApplicationController
  before_action :test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new; end

  def create
    @test.questions.create(question_params)
    redirect_to action: 'index'
  end

  def destroy
    question = Question.find(params[:id]).destroy
    redirect_to test_questions_path(question.test)
  end

  private

  def question_params
    params.permit(:body)
  end

  def test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_not_found
    redirect_to test_questions_path, flash: { error: 'Вопрос не найден!' }
  end
end