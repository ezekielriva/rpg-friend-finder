class DashboardController < ApplicationController
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!
  before_action :set_title
  before_action :set_subtitle, except: :show
  before_action :alert_address

  add_breadcrumb "<i class='fa fa-dashboard'></i> Home".html_safe, :root_path

  def index
    @no_users  = User.count
    @no_groups = Group.count
  end

  private

  def set_title
    @title = params[:controller].humanize
  end

  def set_subtitle
    @subtitle = params[:action].humanize
  end

  def alert_address
    if current_user.has_not_address?
      flash.now[:alert] = "You must add your address to enable your location in the map. Change it <a href='#{edit_user_registration_path}'>here</a>".html_safe
    end
  end
end
