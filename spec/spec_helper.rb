# Configure Rails Envinronment - figured this out via http://stackoverflow.com/questions/5374504/rspec-gem-development-stubbing-rails-templates/6272019#6272019
ENV["RAILS_ENV"] = "test"
require File.join(File.dirname(__FILE__), 'dummy', 'config', 'environment.rb')

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'rails/test_help'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jeditable-rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_framework = :rspec
end
