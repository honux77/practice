# Set the current app's path for later reference. Rails.root isn't available at
# this point, so we have to point up a directory.
# app_path = File.expand_path(File.dirname(__FILE__) + '/..')
app_path = File.expand_path(File.dirname(__FILE__))

# The number of worker processes you have here should equal the number of CPU
# cores your server has.
worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)

# You can listen on a port or a socket. Listening on a socket is good in a
# production environment, but listening on a port can be useful for local
# debugging purposes.
listen app_path + '/tmp/unicorn.sock', backlog: 64

# For development, you may want to listen on port 3000 so that you can make sure
# your unicorn.rb file is soundly configured.
listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'

# Set the working directory of this unicorn instance.
working_directory app_path

# Set the location of the unicorn pid file. This should match what we put in the
# unicorn init script later.
pid app_path + '/tmp/unicorn.pid'

# You should define your stderr and stdout here. If you don't, stderr defaults
# to /dev/null and you'll lose any error logging when in daemon mode.
stderr_path app_path + '/log/unicorn.log'
stdout_path app_path + '/log/unicorn.log'

# Load the app up before forking.
preload_app true

# Garbage collection settings.
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end


