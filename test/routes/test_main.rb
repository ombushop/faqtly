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

  def test_questions_new
    get '/questions/new'
    assert last_response.body.include?("id='new-questions-form'")
  end

  def test_questions_edit
    @question = Question.create( question: 'How much wood would a woodchuck chuck?',
                      answer:   'alot' )
    get "/questions/edit/#{@question.id}"
    assert_equal 200, last_response.status
    assert last_response.body.include?("value='put'")
  end

  def test_create_a_question
    post '/questions', question: { question: "Hello?", answer: 'Hello world!' }
    assert_equal 302, last_response.status
  end

  def test_error_messages_on_failed_question_create
    old_count = Question.count
    post '/questions', question: { question: "", answer: "" }
    assert last_response.body.include?("answer is not present")
    assert last_response.body.include?("question is not present")
    assert_equal old_count, Question.count
  end

  def test_questions_update
    @question = Question.create( question: 'Lightning?',
                      answer:   'Thunder!' )

    put "/question/#{@question.id}", question: { question: "WWSJD?" }
    assert_equal "WWSJD?", Question[@question.id].question
  end

  def test_question_show
    @question = Question.create( question: 'What would Steve Jobs do?',
                      answer:   'He would probably Stay hungry Stay foolish.' )

    get "/question/#{@question.id}"
    assert_equal 200, last_response.status
    assert last_response.body.include?('Steve Jobs')
  end
end