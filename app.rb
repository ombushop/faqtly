require 'sinatra'
require 'haml'

class Faqtly < Sinatra::Application
  enable :logging

  configure :production, :development do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, 'views'
    set :public_folder, 'public'
    set :haml, { format: :html5 } # default Haml format is :xhtml
    set :clean_trace, true
  end

  configure :test do
    set :root, File.dirname(__FILE__)
    set :views, "#{File.dirname(__FILE__)}/views"
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'