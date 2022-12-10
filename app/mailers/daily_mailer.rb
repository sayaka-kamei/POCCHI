class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.daily_notification.subject
  #
  def daily_notification
    mail to: User.pluck(:email), subject: "本日のPOCCHIご案内"
  end
end
