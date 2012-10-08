module Authentication

  # Enforces authentication in a path
  #
  # Throws HTTP 401 when not authorized
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  # Determines if a user is authorized. It uses HTTP Authentication.
  # 
  # @return [Boolean]
  def authorized?
    user = ENV['ADMIN_USER'] || 'admin'
    pass = ENV['ADMIN_PASSWORD'] || 'admin'

    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [user, pass]
  end
end
