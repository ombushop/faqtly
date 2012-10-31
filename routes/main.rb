# encoding: utf-8
class Faqtly < Sinatra::Application

  get '/404' do
    haml :'404'
  end

  get '/' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
  end

  get '/about' do
    haml :about, layout: :'layouts/application'
  end

  get '/questions' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/questions/search' do
    @query = params[:q]
    @questions = Question.full_text_search(@query)
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/questions/new' do
    protected!
    @question = Question.new
    haml :'questions/new', layout: :'layouts/application'
  end

  get '/tags/new' do
    protected!

    @tag = Tag.new
    haml :'tags/new', layout: :'layouts/application'
  end

  get '/questions/:id/edit' do
    protected!
    @question = Question[params[:id]]
    haml :'questions/edit', layout: :'layouts/application'
  end

  post '/questions' do
    protected!
    @question = Question.new(params[:question])
    @question.raise_on_save_failure = false

    if @question.save
      redirect to('/questions')
    else
      haml :'questions/new', layout: :'layouts/application'
    end
  end

  put '/questions/:id' do
    protected!
    @question = Question[params[:id]]
    @question.raise_on_save_failure = false
    if @question.update(params[:question])
      redirect to('/questions')
    else
      haml :"questions/edit/#{@question.id}", layout: :'layouts/application'
    end
  end

  get %r{/questions/(.*)} do |permalink|
    @question = Question.find_by_permalink(escape_for_url(permalink))
    haml :'questions/show', layout: :'layouts/application'
  end
end