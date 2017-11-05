class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login

  def require_login
    if current_user == nil
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def hours
    return Setting.find(1).hours_in_a_day
  end

  def compute_hours(unit)

    if (unit == 'Hours')
      return 1
    elsif (unit == 'Days')
      return hours
    elsif (unit == 'Weeks')
      return 5*hours
    elsif (unit == 'Months')
      return 40*hours
    else
    end

  end


end
