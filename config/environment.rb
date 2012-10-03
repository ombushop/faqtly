require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sequel'

DB = Sequel.connect(ENV["DATABASE_URL"] || "postgres://localhost/ayuda_#{Sinatra::Base.environment}")
DB << "SET CLIENT_ENCODING TO 'UTF8';"