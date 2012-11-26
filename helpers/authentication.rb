module Authentication

  # Enforces authentication in a path
  #
  # Throws HTTP 401 when not authorized
  def protected!
    if authorized?
      session[:user] = @auth.credentials.first
    else
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  # Returns the current user name from the session
  #
  # @return [String,nil]
  def current_user
    session[:user]
  end

  # Returns true or nil if the current user can or
  # cannot do something
  # 
  # @return [String,nil]
  def can?
    current_user
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
