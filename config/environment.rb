require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sequel'
require 'compass'
require 'sinatra/support/i18nsupport'

def database_connect(database_name, username, password, database_type = 'postgres')
  result = Sequel.connect(ENV["DATABASE_URL"] || 
    "#{database_type}://#{username}:#{password}@localhost/#{database_name}")
  result << "SET CLIENT_ENCODING TO 'UTF8';"
end

require_relative "environments/#{Sinatra::Base.environment}"