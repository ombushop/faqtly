module Routes

  # 
  # Admin paths
  # 
  module Admin
    
    get '/questions/new' do
      protected!
      @question = Question.new
      haml :'questions/new', layout: :'layouts/application'
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

    get '/questions/:id/edit' do
      protected!
      @question = Question[params[:id]]
      haml :'questions/edit', layout: :'layouts/application'
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

    post '/tags' do
      protected!

      @tag = Tag.new(params[:tag])

      if @tag.save
        redirect '/tags'
      else
        haml :'tags/new', layout: :'layouts/application' 
      end
    end  

    delete '/tags/:name' do |name|
      protected!

      @tag = Tag.where(name: name)

      if @tag
        unless @tag.delete
          flash[:error] = t(:'fail.delete')
        end

        redirect '/tags'
      else
        redirect '/404'
      end
    end

    get '/tags/:name/edit' do |name|
      protected!

      @tag = Tag.where(name: name).first
      haml :'tags/edit', layout: :'layouts/application'
    end

    get '/tags/new' do
      protected!

      @tag = Tag.new
      haml :'tags/new', layout: :'layouts/application'
    end
  end
end