ActionMailer::Base.smtp_settings = {
  authentication: :login,
  address: 'smtp.mailgun.org',
  port: 587,
  domain: 'hqx86.com',
  user_name: ENV['smtp_lg'],
  password: ENV['smtp_ps']
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
