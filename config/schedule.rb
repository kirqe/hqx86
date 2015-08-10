

job_type :rake, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec rake :task --silent :output"
job_type :script, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec script/:task :output"
job_type :runner, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec rails runner ':task' :output"

set :output, "#{path}/log/cron.log"

every 1.day do  
  rake "sitemap:generate"        
end


# every :reboot do
#   command "sidekiq -q mailer -q default"
# end