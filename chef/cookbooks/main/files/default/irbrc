def w pid
  NewReportWorker.new.perform pid
end

begin
  require 'rubygems'
  require 'active_record'
  require 'yaml'
  require 'pp'
  require 'ap'
rescue LoadError => e
  puts e.message + " No worries. Continuing"
end

# IRB Options
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>>
  if IRB.conf[:PROMPT]
    IRB.conf[:PROMPT][:CUSTOM] = {
     :PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
     :PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
     :PROMPT_S => nil,
     :PROMPT_C => "?> ",
     :RETURN => "=> %s\n"
     }
    # Set default prompt
    IRB.conf[:PROMPT_MODE] = :CUSTOM
  end
end

def sql(a)
  ActiveRecord::Base.connection.execute(a).fetch_hash
end

# # detects a rails console, cares about version
def rails?(*args)
  version=args.first
  v2 = ($0 == 'irb' && ENV['RAILS_ENV'])
  v3 = ($0 == 'script/rails' && Rails.env)
  version == 2 ? v2 : version == 3 ? v3 : v2 || v3
end
#
# # activerecord logging methods
# # very useful for digging into
# # # queries
# require 'logger'
# #require 'activerecord' if rails?(2)
#
def enable_logger
   log_to(Logger.new(STDOUT))
end

def disable_logger
  log_to(nil)
end

def log_to(logger)
  ActiveRecord::Base.logger = logger
  ActiveRecord::Base.clear_active_connections!
end


# logging into console by default
#enable_logger

## Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined? Bundler
  #Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  #Gem::Specification.reset
  #load 'rubygems/custom_require.rb'
end

class Object
  def pmeth
    (public_instance_methods - Object.public_instance_methods).sort
  end

  def meth
    (methods - Object.methods).sort
  end
end

def blackman
  return @_blackman if @_blackman

  @_blackman = User.where("email = 'tdblackman@gmail.com' or email = 'tblackman@locationinc.com'").first
rescue
end

def bench
  return "You need a block to measure" unless block_given?

  Benchmark.bm {|r| r.report { yield } }
end
