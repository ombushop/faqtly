require 'test_helper'

class TestFaqtly < Test::Unit::TestCase

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

  def test_questions_new
    get '/questions/new'
    assert last_response.body.include?("id='new-questions-form'")
  end

  def test_create_a_question
    post '/questions', question: { question: "Hello?", answer: 'Hello world!'}
    assert last_response.body.include?("F.A.Q")
    assert last_response.body.include?("Hello world!")
  end

end