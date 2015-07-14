class Api::V1::UsersController < ApplicationController
  def index
    render json: User.with_address.all
  end
end
