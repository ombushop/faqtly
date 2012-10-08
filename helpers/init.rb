# encoding: utf-8
require_relative 'render_partial'
require_relative 'authentication'

Faqtly.helpers RenderPartial
Faqtly.helpers Authentication
Faqtly.helpers Rack::Utils