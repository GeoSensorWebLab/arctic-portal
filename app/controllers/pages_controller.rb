class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def show
    if params[:id] == "home"
      authenticate
    else
      super
    end
  end

  private

  def authenticate
    if current_user
      render template: current_page
    else
      authenticate_user!
    end
  end
end
