class ContactWorker < ActionMailer::Base
  include Sidekiq::Worker

  def perform(h, count)
    h = JSON.load(h)
    ContactMailer.contact_email(h['name'], h['email'], h['message']).deliver
  end
end
