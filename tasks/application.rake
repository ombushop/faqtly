desc 'Start the application'
task :start do
  system "bundle exec shotgun config.ru"
end

task :environment do
  require './config/environment'
end
