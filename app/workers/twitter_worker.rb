class TwitterWorker
  include Sidekiq::Worker
  include Tweets
  include Rails.application.routes.url_helpers
  
  def perform(message, slug)
    url = Bitly.client.shorten(post_url(slug, host: ActionMailer::Base.default_url_options[:host])).short_url
    tweet("#{message} #{url}")
  end
end