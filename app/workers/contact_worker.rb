class ContactWorker < MailForm::Base
  include Sidekiq::Worker

  def perform(h)
    h = JSON.load(h)
    ContactMailer.contact_email(
      h['name'],
      h['email'],
      h['message'],
      h['request_type'],
      h['budget'],
      h['purpose'],
      h['build_info']).deliver
  end
end
