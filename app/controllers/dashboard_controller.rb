class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_title
  before_action :set_subtitle, except: :show

  def index
  end

  private

  def set_title
    @title = params[:controller].humanize
  end

  def set_subtitle
    @subtitle = params[:action].humanize
  end
end
