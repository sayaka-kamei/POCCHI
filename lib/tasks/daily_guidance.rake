namespace :daily_guidance do
  desc "am11時半にユーザー全員POCCI案内メールで送る"
    task mail_daily_guidance: :environment do
      DailyMailer.daily_notification.deliver_now
      puts "成功"
    end
end
#daily_notificationメソッドを動かし、deliver_nowでメールを送っている