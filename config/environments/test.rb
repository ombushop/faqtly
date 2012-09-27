puts "Loading test"
Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/ayuda_#{Sinatra::Base.environment}")
