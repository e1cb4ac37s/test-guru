class TestsController < ApplicationController
  def index
    @tests = Test.all.preload(:questions)
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end
end