class ApplicationMailer < ActionMailer::Base
  default from: ENV['DB_USERNAME']
  layout 'mailer'
end
