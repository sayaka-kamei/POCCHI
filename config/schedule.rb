# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
set :output, './log/cron.log'
require File.expand_path(File.dirname(__FILE__) + '/environment')
set :path_env, ENV['PATH']
rails_env = ENV['RAILS_ENV'] || :development
set :environment, :production
job_type :rake,   "cd :path && PATH=':path_env' :environment_variable=:environment bundle exec rake :task --silent :output"
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

every 1.days, at: '11:30 am' do
  rake 'daily_guidance:mail_daily_guidance'
end
# end

# Learn more: http://github.com/javan/whenever
