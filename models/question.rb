# encoding: utf-8
class Question < Sequel::Model
  plugin :validation_helpers

  def validate
    super
    validates_presence [:question, :answer]
    validates_unique [:question]
  end
end