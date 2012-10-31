module Routes
  module Static

  end
end
  # 
  # General paths
  # 
  get '/' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/404' do
    haml :'404'
  end

  get '/about' do
    haml :about, layout: :'layouts/application'
  end

  get '/questions' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get %r{/questions/(.*)} do |permalink|
    @question = Question.find_by_permalink(escape_for_url(permalink))
    haml :'questions/show', layout: :'layouts/application'
  end

  get '/questions/search' do
    @query = params[:q]
    @questions = Question.full_text_search(@query)
    haml :'questions/index', layout: :'layouts/application'
  end  

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
  end

  get '/tags' do
    @tags = Tag.all

    haml :'tags/index', layout: :'layouts/application'
  end