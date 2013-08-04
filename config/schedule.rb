# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/mnt/d/rails/r4/cron_log.log"
#set :job_template, "/bin/bash -i -c ':job'"
set :environment, 'development'
#set :path, '/mnt/d/rails/r4'
env :path, '/mnt/d/rails/r4'

every 1.minute do
  command "echo #{:path}"                             # confirm shell variable PATH was loaded
  
  command "pwd"                                    # visualize current directory
  #command "rvm current"                            # visualized default ruby version and gemset
  #runner "CrawlDwjl.getPage" #, :environment => 'development'
  #runner 'CrawlDwjl.getPage "www.google.com"'
end

#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
