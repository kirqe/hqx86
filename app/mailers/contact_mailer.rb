class ContactMailer < ApplicationMailer
  def contact_email(name, email, message, request_type, budget, purpose, build_info)
    @name, @email, @message, @request_type, @budget, @purpose, @build_info = name, email, message, request_type, budget, purpose, build_info
    mail(to: ENV['contact_email'], subject: "hqx86 #{@request_type}")
  end
end
