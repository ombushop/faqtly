require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra'
require 'test/unit'
require 'sequel_test_case'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false
puts Sinatra::Base.environment
require File.join(File.dirname(__FILE__), '../app')
Sequel.connect("postgres://localhost/ayuda_test")

def deny(test, msg=nil)
  if msg then
    assert !test, msg
  else
    assert !test
  end
end