#Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/mnt/d/rails/r4/cron_log.log"
#set :job_template, "/bin/bash -i -c ':job'"

every 30.minutes do
  #command "echo $PATH"                             # confirm shell variable P 
  #command "cd #{path}"                             # this is not needed
  #command "pwd"                                    # visualize current directory
  #command "rvm current"                            # visualized default ruby version and gemset
  #command "rvm use ruby-1.9.3-p448@railstutorial_rails_4_0"
  #command "rvm current"  
  command "date"  
  runner 'CrawlDwjl.get', :environment => :development

end

# Learn more: http://github.com/javan/whenever
