class QuestionsController < ApplicationController
  before_action :test, only: %i[index create new]
  before_action :question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to action: 'index'
    else
      #
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.permit(:body)
  end

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end

  def rescue_from_not_found
    redirect_to test_questions_path, flash: { error: 'Вопрос не найден!' }
  end
end