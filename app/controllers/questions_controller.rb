class QuestionsController < ApplicationController
  before_action :test, except: %i[index, create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @questions = test.questions
  end

  def show
    @question = test.questions.find(params[:id])
  end

  def new; end

  def create
    new_question = test.questions.create(body: params[:body])
    answers = params[:answers].map do |answer|
      correct = answer[:correct] = 'on' ? true : false
      Answer.create(
        body: answer[:body],
        correct: correct,
        question: new_question
      ) if answer[:body]
    end
    redirect_to action: 'index'
  end

  def destroy
    test.questions.find(params[:id]).destroy
    redirect_to test_questions_path
  end

  private

  def test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_not_found
    redirect_to test_questions_path, flash: { error: 'Вопрос не найден!' }
  end
end