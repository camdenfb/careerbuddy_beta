class HomeController < ApplicationController
  before_action :set_auth
  skip_before_action :require_login

  def show
    if (!session.key?("user_id"))
      redirect_to login_path
    end
  end

  def login
    if (session.key?("user_id"))
      redirect_to root_path
    end
  end

  private
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]

  end

end
