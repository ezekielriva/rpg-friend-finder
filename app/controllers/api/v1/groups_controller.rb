class Api::V1::GroupsController < ApplicationController
  def index
    render json: Group.all
  end
end
