require 'rubygems'
require 'bundler/setup'
require 'rake'
require 'rake/testtask'

Bundler.setup

Dir["tasks/*.rake"].sort.each { |ext| load ext }

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "models"
  t.libs << "routes"
  t.libs << "helpers"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end

task default: :test