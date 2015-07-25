class ContactWorker < ActionMailer::Base
  include Sidekiq::Worker
  include Rails.application.routes.url_helpers

  def perform(contact)

  end
end
