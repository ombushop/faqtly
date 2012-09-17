ENV['RACK_ENV'] ||= 'development'
require "./config/environments/#{ENV['RACK_ENV']}"
