require 'pry'

# encoding: utf-8
class Question < Sequel::Model
  plugin :validation_helpers
  
  def validate
    super
    validates_presence [:question, :answer]
    validates_unique [:question]
  end

  # Finds a set of [Question] instances with the query.
  # It searches through question and answer content.
  # 
  # @return [Array]
  def self.full_text_search(query)
    Question.where(Sequel.like(:answer, "%#{query}%")).
                  or(Sequel.like(:question, "%#{query}%"))
    # TODO full_text_search('answer', query)
  end

  # Finds a [Question] using the permalink
  #
  # @return [Question,nil]
  def self.find_by_permalink(permalink)
    Question.where(permalink: permalink).first
  end

  private

  # Updates the permalink using Rack::Utils
  def before_validation
    binding.pry
    self.permalink = Rack::Utils.escape(self.question)
  end
end