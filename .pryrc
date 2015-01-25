$:.unshift '.'
$:.unshift 'lib'

def rails_commands
  rails = File.join Dir.getwd, 'config', 'environment.rb'
  if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
    require rails

    if Rails.version[0] == "2"
      require 'console_app'
      require 'console_with_helpers'
    elsif Rails.version[0] == "3"
      if Rails.version[2].to_i > 1 # 3.2 or higher
        warn "[WARN] 3.2 not supported????"
      else
        require 'rails/console/app'
        require 'rails/console/helpers'
      end
    else
      warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
    end
  end
rescue LoadError
  warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
end

def be_awesome
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.send(:ap, value) }
rescue LoadError
  warn "[WARN] cannot load awesome_print"
end

def active_record_to_terminal
  require 'active_record'
  require 'logger'

  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = Logger::DEBUG
  ActiveRecord::Base.logger.formatter = proc { |severity, datetime, progname, msg| "#{msg}\n" }
  ActiveRecord::Base.clear_active_connections!
end

def sql(a)
  ActiveRecord::Base.connection.execute(a).to_a
end

active_record_to_terminal
rails_commands
be_awesome
Pry.config.editor = 'vim'

begin
  require 'ruby-debug'
  require 'hirb'
  require 'wirble'

  # Dirty hack to support in-session Hirb.disable/enable
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || output.send(:ap, value)
      end
    end

    def disable_output_method
      Pry.config.print = proc { |output, value| output.send(:ap, value) }
      @output_method = nil
    end
  end
  Hirb.enable

rescue LoadError
  # Missing some goodies, bummer
end

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'l', 'whereami'
end

def remove_security
  exe = <<-EOF
    class ApplicationController < ActionController::Base
      def authorize! *args
        true
      end

      def authenticate_user! *args
        true
      end
    end

    class WebsitesController < ApplicationController
      def authorize! *args
        true
      end
    end
  EOF

  eval(exe)
end

def get req
  app.get(req)
  File.open('rails_output', 'w:ascii-8bit') { |f| f.write app.response.body }
end

load '/home/blackman/.irbrc'
