# encoding: utf-8
DB = Sequel.connect(ENV["DATABASE_URL"] || "postgres://localhost/ayuda_#{Sinatra::Base.environment}")
DB << "SET CLIENT_ENCODING TO 'UTF8';"

require_relative 'question'