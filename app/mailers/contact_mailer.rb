class ContactMailer < ApplicationMailer
  def contact_email(name, email, message, request_type)
    @name, @email, @message, @request_type = name, email, message, request_type
    mail(to: ENV['contact_email'], subject: "hqx86 #{@request_type}")
  end
end
