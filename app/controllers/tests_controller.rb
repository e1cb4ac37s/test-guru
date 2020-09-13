class TestsController < ApplicationController
  def index
    @tests = Test.all.preload(:questions)
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests << @test
    redirect_to current_user.test_passage(@test)
  end
end