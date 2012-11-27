source :rubygems

gem 'rake'
gem 'sinatra', '~> 1.2.3'
gem 'sinatra-support'
gem 'shotgun', '~> 0.9'
gem 'haml', '~> 3.1.4'
gem 'sequel'

gem 'thin'
gem 'i18n'

# Sass & Compass
gem 'sass', '~> 3.1.12'
gem 'compass', '~> 0.11.6'

# Sass libraries
gem 'grid-coordinates', '~> 1.1.4'
gem 'rack-flash3'

group :deployment do
  gem 'heroku'
end

group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'pry'
  gem 'pry-nav'
end

group :production do
  gem 'sequel_pg'
  gem 'pg', "0.13.2"
end

group :test do
  gem 'factory_girl'
  gem 'autotest'
  gem 'rack-test', require: 'rack/test'
end
