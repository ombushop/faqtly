# encoding: utf-8

require 'test_helper'

class TestQuestions < Test::Unit::TestCase
  def app
    Faqtly
  end

  def test_create_a_question
    basic_authorize('admin', 'admin')
    post '/questions', question: { question: "Hello?", answer: 'Hello world!' }
    assert_equal 302, last_response.status
  end

  def test_error_messages_on_failed_question_create
    basic_authorize('admin', 'admin')
    old_count = Question.count
    post '/questions', question: { question: "", answer: "" }
    assert last_response.body.include?("answer is not present")
    assert last_response.body.include?("question is not present")
    assert_equal old_count, Question.count
  end

  def test_questions_edit
    @question = Question.create( question: 'How much wood would a woodchuck chuck?',
                      answer:   'alot' )
    basic_authorize('admin', 'admin')
    get "/questions/#{@question.permalink}/edit"
    assert_equal 200, last_response.status
    assert last_response.body.include?("value='put'")
  end

  def test_questions_delete
    @question = Question.create( question: '¿Y candela? ¿¡Y la moto??',
                  answer:   'Está todo bien' )
    old_count = Question.count
    basic_authorize('admin', 'admin')

    delete "/questions/#{@question.permalink}"
    assert_equal 302, last_response.status
    assert_equal Question.count, old_count - 1
  end

  def test_questions_new_for_authorized_user
    basic_authorize('admin', 'admin')
    get '/questions/new'
    assert last_response.body.include?("id='new-questions-form'")
  end  

  def test_questions_update
    @question = Question.create( question: 'Lightning?',
                      answer:   'Thunder!' )

    basic_authorize('admin', 'admin')
    put "/questions/#{@question.permalink}", question: { question: "WWSJD?" }
    assert_equal "WWSJD?", Question[@question.id].question
  end
end