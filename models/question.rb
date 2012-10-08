# encoding: utf-8
class Question < Sequel::Model
  plugin :validation_helpers

  def validate
    super
    validates_presence [:question, :answer]
    validates_unique [:question]
  end

  def self.full_text_search(query)
    DB[:questions].full_text_search(['question','answer'], query)
  end
end