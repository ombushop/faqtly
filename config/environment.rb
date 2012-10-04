require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sequel'

db_username = ENV["DATABASE_USERNAME"]
DB = Sequel.connect(ENV["DATABASE_URL"] || 
		"postgres://#{db_username}:#{ENV["DATABASE_PASSWORD"]}@localhost/ayuda_#{Sinatra::Base.environment}")
DB << "SET CLIENT_ENCODING TO 'UTF8';"