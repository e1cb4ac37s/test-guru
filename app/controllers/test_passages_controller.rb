class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    if @test_passage.expired?
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    if params[:answer_ids]&.any?
      @test_passage.accept!(params[:answer_ids])
      if @test_passage.completed?
        BadgeService.new(@test_passage).call
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      flash.now[:alert] = 'Select at least one answer'
      render :show
    end
  end

  def gist
    gist_service = GistsService.new
    response = gist_service.create(@test_passage.current_question, current_user)

    flash_options = if gist_service.success?
      { notice: t('.success', url: response.html_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
