class TwitterWorker
  include Sidekiq::Worker
  include Tweets
  include Rails.application.routes.url_helpers
  
  def perform(message, slug, model_name)
    obj_url = send("#{model_name}_url", slug, host: ActionMailer::Base.default_url_options[:host])
    url = Bitly.client.shorten(obj_url).short_url
    tweet("#{message} #{url}")
  end
end