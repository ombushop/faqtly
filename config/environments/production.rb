puts "Loading production environment"

Sequel.connect(ENV['DATABASE_URL'])
