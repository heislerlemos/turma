class TokensController < ApplicationController
  before_action :require_login


  def create
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      api_key = ENV['TWILIO_API_KEY']
      api_secret = ENV['TWILIO_API_SECRET']

  	identity = current_user.email


  		grant = Twilio::JWT::AccessToken::ChatGrant.new
  		grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']


  		token = Twilio::JWT::AccessToken.new(
  			account_sid,
        api_key,
        api_secret,  			
  			[grant],
  			identity: identity
  			)

    render json: {identity: identity, token: token.to_jwt}
  end
end
