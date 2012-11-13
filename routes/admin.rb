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

      if @question.save
        redirect to('/questions')
      else
        haml :'questions/new', layout: :'layouts/application'
      end
    end

    get '/questions/:permalink/edit' do |permalink|
      protected!
      @question = find_question(permalink)
      haml :'questions/edit', layout: :'layouts/application'
    end

    put '/questions/:permalink' do |permalink|
      protected!

      @question = find_question(permalink)

      if @question.update(params[:question])
        redirect to('/questions')
      else
        haml :"questions/edit", layout: :'layouts/application'
      end
    end

    delete '/questions/:permalink' do |permalink|
      protected!

      @q = find_question(permalink)
      
      unless @q.delete
        flash[:error] = t(:'fail.delete')
      end

      redirect '/tags'
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

    put '/tags/:permalink' do |permalink|
      protected!

      @tag = find_tag(permalink)

      if @tag.update(params[:tag])
        redirect to('/tags')
      else
        haml :"tags/edit", layout: :'layouts/application'
      end
    end    

    delete '/tags/:permalink' do |permalink|
      protected!

      @tag = find_tag(permalink)

      unless @tag.delete
        flash[:error] = t(:'fail.delete')
      end

      redirect '/tags'
    end

    get '/tags/:permalink/edit' do |permalink|
      protected!

      @tag = find_tag(permalink)
      haml :'tags/edit', layout: :'layouts/application'
    end

    get '/tags/new' do
      protected!

      @tag = Tag.new
      haml :'tags/new', layout: :'layouts/application'
    end
  end
end