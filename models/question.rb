# encoding: utf-8
class Question < Sequel::Model
  include Permalinker

  self.raise_on_save_failure = false

  plugin :validation_helpers
  many_to_many :tags
  
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

  def self.paginated(params = {})
    scope = params[:scope] || Question
    page = params[:page] || 1
    per_page = params[:per_page] || 2
    scope.paginate(page.to_i, per_page.to_i)
  end

  private

  # Updates the permalink using [Permalinker]
  def before_validation
    self.permalink = generate_permalink(self.question)
  end
end