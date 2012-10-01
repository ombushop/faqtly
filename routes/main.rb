# encoding: utf-8
class Faqtly < Sinatra::Application
  get '/' do
    haml :index, layout: :'layouts/application'
  end

  get '/about' do
    haml :about, layout: :'layouts/page'
  end

  get '/questions/new' do
    @question = Question.new
    haml :'questions/new', layout: :'layouts/application'
  end

  post '/questions' do
    # @question =
  end
end