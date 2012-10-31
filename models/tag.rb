# encoding: utf-8
class Tag < Sequel::Model
  plugin :validation_helpers
  many_to_many :questions

  def validate
    super
    validates_presence [:name]
    validates_unique [:name]
  end
end
