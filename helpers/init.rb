# encoding: utf-8
require_relative 'render_partial'
require_relative 'authentication'
require_relative 'questions_helper'



Faqtly.helpers Rack::Utils
Faqtly.helpers Authentication
Faqtly.helpers RenderPartial
Faqtly.helpers QuestionsHelper