class TokensController < ApplicationController
  before_action :require_login


  def create

    render json: {"success": true}
  end
end
