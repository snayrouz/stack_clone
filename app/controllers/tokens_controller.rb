class TokensController < ApplicationController
  before_filter :authenticate!

  def get_token(identity)
    token = Twilio::JWT::AccessToken.new ENV['TWILIO_ACCOUNT_SID'],
    ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], identity: identity
  end

  def get_grant
    grant = Twilio::JWT::AccessToken::IpMessagingGrant.new
    grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
    token.add_grant grant
  end

  def create
    token = get_token
    grant = get_grant
    token.add_grant(grant)
    render json: {username: current_user.username, token: token.to_jwt}
  end

end
