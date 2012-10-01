require 'rubygems'
require 'bundler/setup'
require 'haml'

require 'sinatra' unless defined?(Sinatra)
require 'app'

configure do
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") do |lib|
    require File.basename(lib, '.*')
  end


end