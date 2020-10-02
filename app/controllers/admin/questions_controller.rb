class Admin::QuestionsController < Admin::BaseController
  before_action :test, only: %i[index create new]
  before_action :question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def show
    @test = @question.test
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      #
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end

  def rescue_from_not_found
    redirect_to test_questions_path, flash: { error: 'Question is not found!' }
  end
end
