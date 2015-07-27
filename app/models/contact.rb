class Contact < MailForm::Base
  attribute :request_type

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  attribute :budget
  attribute :purpose
  attribute :build_info

  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  # def headers
  #   {
  #     :subject => "hqx86 #{request_type}",
  #     :to => ENV['contact_email'],
  #     :from => %("#{name}")
  #   }
  # end
end