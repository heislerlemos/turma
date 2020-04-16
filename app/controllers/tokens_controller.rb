class TokensController < ApplicationController
  before_action :require_login


  def create
      
      #account_sid = ENV['TWILIO_ACCOUNT_SID']
      #api_key = ENV['TWILIO_API_KEY']
      #api_secret = ENV['TWILIO_API_SECRET']
        account_sid = ENV['AC4a2579defdde8e8b5bf730e045c37095']
         api_key = ENV['SK431c2fa98a74b6dd134b44404df8455c']
         api_secret = ENV['5B8kNbivP3OT2ESUAp6lLPR9Lcjm0uQC']
  	identity = current_user.email


  		grant = Twilio::JWT::AccessToken::ChatGrant.new
  		#grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
      grant.service_sid = ENV['IS47d29b41b35b4e00b727e409f8a9e212']

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
