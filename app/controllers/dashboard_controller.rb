class DashboardController < ApplicationController
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_title
  before_action :set_subtitle, except: :show
  before_action :alert_address

  add_breadcrumb I18n.t(".breadcrumbs.home").html_safe, :root_path

  def index
    @no_users  = User.count
    @no_groups = Group.count
  end

  def changelog
    @file_path = Rails.root.join("CHANGELOG.md")
  end

  private

  def set_title
    @title = I18n.t(".title.#{params[:controller]}")
  end

  def set_subtitle
    @subtitle = I18n.t(".subtitle.#{params[:action]}")
  end

  def alert_address
    if current_user && current_user.has_not_address?
      flash.now[:alert] = I18n.t(".alerts.missing_address", path: edit_user_registration_path)
    end
  end
end
