class TokensController < ApplicationController
  before_action :require_login


  def create
  	identity = current_user.email


  		grant = Twilio::JWT::AccessToken::ChatGrant.new
  		grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']


  		token = Twilio::JWT::AccessToken.new(
  			ENV['TWILIO_ACCOUNT_SID'],
  			ENV['TWILIO_API_KEY'],
  			ENV['TWILIO_API_SECRET'],
  			[grant],
  			identity: identity
  			)

    render json: {identity: identity, token: token.to_jwt}
  end
end
