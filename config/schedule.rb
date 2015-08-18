set :output, "#{path}/log/cron.log"
job_type :runner, "cd #{path} && RAILS_ENV=production /home/$USER/.rvm/wrappers/ruby-2.2.2/bundle exec rails runner ':task' :output"

every 1.day, :at => '4:30 am' do
  rake "sitemap:generate"
  command "ln -s #{path}/public/sitemaps/sitemap.xml #{path}/public/sitemap.xml"
end


# every :reboot do
#   command "sidekiq -q mailer -q default"
# end








