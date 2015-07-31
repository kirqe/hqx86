
set :output, "#{path}/log/cron.log"


every 1.minute do  
  rake "sitemap:generate"                 
end


# every :reboot do
#   command "sidekiq -q mailer -q default"
# end