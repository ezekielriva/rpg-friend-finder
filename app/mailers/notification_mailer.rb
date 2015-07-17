class NotificationMailer < ApplicationMailer
  def admin_email(text: nil, subject: "Admin notification")
    @text = text
    mail(to: ENV["ADMIN_EMAIL"], subject: subject)
  end
end
