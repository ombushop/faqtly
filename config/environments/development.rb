puts "Loading development"
Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/ayuda_development')

