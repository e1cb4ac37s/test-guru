class FeedbacksController < ApplicationController
  def new; end
  def create
    FeedbacksMailer.with(user: current_user, body: params[:feedback][:body]).send_feedback.deliver_now
    redirect_to root_path
  end
end
