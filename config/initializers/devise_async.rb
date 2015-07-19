Devise::Async.enabled = true
# Supported options: :resque, :sidekiq, :delayed_job
Devise::Async.backend = :sidekiq