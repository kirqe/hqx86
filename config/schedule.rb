
set :output, "#{path}/log/cron.log"


every 1day do  
  rake "sitemap:generate"        
end


# every :reboot do
#   command "sidekiq -q mailer -q default"
# end