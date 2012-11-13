# encoding: utf-8
class Tag < Sequel::Model
  include Permalinker

  self.raise_on_save_failure = false
  
  plugin :validation_helpers
  many_to_many :questions

  def validate
    super
    validates_presence [:name]
    validates_unique [:name]
  end

  private

    # Updates the permalink using [Permalinker]
    def before_validation
      self.permalink = generate_permalink(self.name)
    end
end
