# class ContactWorker < MailForm::Base
#   include Sidekiq::Worker
#   include MailForm::Delivery
#
#   def perform(c)
#     c.deliver
#
#   end
# end
