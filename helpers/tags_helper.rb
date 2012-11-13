module TagsHelper

  # Finds the right [Tag] or raises a [Sinatra::NotFound] exception.
  #
  # @param [String] Permalink
  # @param [Tag]
  # @raise [Sinatra::NotFound]
  def find_tag(permalink)
    result = Tag.where(permalink: permalink).first
    raise Sinatra::NotFound unless result
    
    result
  end
end

