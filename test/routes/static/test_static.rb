require 'test_helper'

class TestMain < Test::Unit::TestCase
  def app
    Faqtly
  end

  def test_root
    get '/'
    assert_equal 200, last_response.status
  end

  def test_about_page
    get '/about'
    assert_equal 200, last_response.status
  end

  def test_questions_new_for_unauthorized_user
    get '/questions/new'
    assert_equal 401, last_response.status
  end

  def test_questions_search
    @question = Question.create( question: 'Y candela? Y la moto?',
                      answer:   'alot' )

    get "/questions/search?q=candela"
    assert_equal 200, last_response.status
    assert last_response.body.include?("la moto")
  end  

  def test_question_show
    @question = Question.create( question: 'What would Steve Jobs do?',
                      answer: 'He would probably Stay hungry Stay foolish.' )

    get "/questions/#{@question.permalink}"
    assert_equal 200, last_response.status
    assert last_response.body.include?('Steve Jobs')
  end
end