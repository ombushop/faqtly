require 'rubygems'
require 'sinatra'
require 'haml'
require 'sequel'

# Helpers
require './lib/render_partial'

class App < Sinatra::Application
  # Set Sinatra variables
  configure :production, :development do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, 'views'
    set :public_folder, 'public'
    set :haml, { format: :html5 } # default Haml format is :xhtml
    enable :logging
  end

  # Application routes
  get '/' do
    haml :index, layout: :'layouts/application'
  end

  get '/about' do
    haml :about, layout: :'layouts/page'
  end

  # questions routes
  get '/questions/new' do
    @question = Question.new
    haml :'questions/new', layout: :'layouts/application'
  end

  post '/questions' do
    # @question =
  end
end

require_relative 'models/init'