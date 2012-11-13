module QuestionsHelper
  def find_question(permalink)
    result = Question.find_by_permalink(generate_permalink(permalink))
    raise Sinatra::NotFound unless result
    
    result
  end
end
