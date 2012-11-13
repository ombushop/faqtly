module QuestionsHelper

  # Finds the right [Question] or raises a [Sinatra::NotFound] exception.
  #
  # @param [String] Permalink
  # @param [Question]
  # @raise [Sinatra::NotFound]
  def find_question(permalink)
    result = Question.find_by_permalink(permalink)
    raise Sinatra::NotFound unless result
    
    result
  end
end
