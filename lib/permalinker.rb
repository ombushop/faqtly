module Permalinker

  # Converts a string in a URL friendly string
  # @param [String] Unescaped input
  # @return [String] Escaped URL
  def escape_for_url(string)
    Rack::Utils.escape(string).gsub(/\+/,'-')
  end
end
