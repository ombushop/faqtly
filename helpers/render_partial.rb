# Borrowed from Tanner Burson: http://github.com/tannerburson
# http://github.com/adamstac/sinatra-plugins/blob/master/render_partial.rb

module RenderPartial

  def partial(page, options={})
    haml page, options.merge!(:layout => false)
  end

  # Calculates the page title using a question.
  #
  # @param [Question,nil]
  # @return [String] Page title
  def page_title(question)
    title = "FAQtly, Frequently Asked Questions. "
    title += question.question.to_s if question
    title
  end
end
