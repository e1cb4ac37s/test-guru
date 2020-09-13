class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@restguru.com>}
  layout 'mailer'
end
