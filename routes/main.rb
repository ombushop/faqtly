require_relative 'admin'
require_relative 'static'

# encoding: utf-8
class Faqtly < Sinatra::Application
  include Permalinker
  extend Routes::Admin
  extend Routes::Static
end