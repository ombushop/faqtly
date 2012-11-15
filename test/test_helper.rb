require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra'
require 'test/unit'
require 'rack/test'
require 'debugger'
require 'sequel_test_case'

ENV['RACK_ENV'] = 'test'

# Making Rack::Test available to all test cases
class Test::Unit::TestCase
  include Rack::Test::Methods
end

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false
puts Sinatra::Base.environment
require File.join(File.dirname(__FILE__), '../app')

def deny(test, msg=nil)
  if msg then
    assert !test, msg
  else
    assert !test
  end
end

def authorize_user!
  basic_authorize('admin', 'admin')
end
