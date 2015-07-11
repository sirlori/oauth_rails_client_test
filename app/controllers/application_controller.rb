class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def oauth_client
    @client ||= OAuth2::Client.new(
    	'77455b9d410ad9948476dbcbd64e779ca261e5c36f832315cbf5dfdc112b8bed',
      'c1b4cfd35678941ef0c8d5b2064bddf35abd55cfe48294e1eac8ff2c4eae8c7c' ,
      site: 'http://localhost:3000/'
    )
  end

  def access_token
    @token ||= OAuth2::AccessToken.new(oauth_client, current_user.access_token) if current_user
  end
end
