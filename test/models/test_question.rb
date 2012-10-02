require "test_helper"

class QuestionTest < SequelTestCase
  def test_it_requires_all_fields
    @question = Question.new
    assert !@question.valid?
  end
end