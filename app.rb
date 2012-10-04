require './config/environment'
class Faqtly < Sinatra::Application
  configure :production, :development do
    enable :logging
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, 'views'
    set :public_folder, 'public'
    set :haml, { format: :html5 } # default Haml format is :xhtml
    enable :clean_trace
  end

  configure :test do
    set :root, File.dirname(__FILE__)
    set :views, "#{File.dirname(__FILE__)}/views"
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/main'