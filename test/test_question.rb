require "#{File.dirname(__FILE__)}/test_helper"
require "#{File.dirname(__FILE__)}/../lib/question"

class QuestionTest < SequelTestCase
  def test_it_requires_all_fields
    @question = Question.new
    assert !@question.valid?
  end
end