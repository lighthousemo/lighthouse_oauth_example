class GithubController < ApplicationController

  def callback
    if params[:error]
      render text: "Autentication error: #{params[:error_description]}"
    else
      byebug
      # Create or find user with the twitter info
      # This action does both login and signup
      user = User.first_or_create(email: twitter_info['email'])
      user.first_name  = twitter_info['first_name']
      user.last_name   = twitter_info['last_name']
      user.oauth_token = twitter_credentials['token']
      user.save!

      # TODO: login user

      redirect_to 'treasures'
    end

  end

  # See: https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
  def twitter_info
    request.env['omniauth.auth']['info']
  end

  def twitter_credentials
    request.env['omniauth.auth']['credentials']
  end

end
