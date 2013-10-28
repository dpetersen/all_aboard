require 'resque/tasks'

# Load the environment for jobs
task "resque:setup" => :environment
