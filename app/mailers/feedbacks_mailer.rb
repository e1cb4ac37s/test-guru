class FeedbacksMailer < ApplicationMailer
  def send_feedback
    @user = params[:user]
    @body = params[:body]
    mail to: ENV['SMTP_USERNAME']
  end
end
