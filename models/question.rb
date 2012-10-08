# encoding: utf-8
class Question < Sequel::Model
  plugin :validation_helpers

  def validate
    super
    validates_presence [:question, :answer]
    validates_unique [:question]
  end

  def self.full_text_search(query)
    Question.where(Sequel.like(:answer, "%#{query}%")).
                  or(Sequel.like(:question, "%#{query}%"))
    # TODO full_text_search('answer', query)
  end
end