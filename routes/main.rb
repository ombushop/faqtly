# encoding: utf-8
class Faqtly < Sinatra::Application
  get '/' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/about' do
    haml :about, layout: :'layouts/application'
  end

  get '/questions' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/questions/new' do
    @question = Question.new
    haml :'questions/new', layout: :'layouts/application'
  end

  get '/questions/:id/edit' do
    @question = Question[params[:id]]
    haml :'questions/edit', layout: :'layouts/application'
  end

  post '/questions' do
    @question = Question.new(params[:question])
    @question.raise_on_save_failure = false

    if @question.save
      redirect to('/questions')
    else
      haml :'questions/new', layout: :'layouts/application'
    end
  end

  put '/question/:id' do
    @question = Question[params[:id]]
    @question.raise_on_save_failure = false
    if @question.update(params[:question])
      redirect to('/questions')
    else
      haml :"questions/edit/#{@question.id}", layout: :'layouts/application'
    end
  end

  get '/question/:id' do
    @question = Question[params[:id]]
    haml :'questions/show', layout: :'layouts/application'
  end
end