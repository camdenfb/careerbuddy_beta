class HomeController < ApplicationController
  before_action :set_auth
  skip_before_action :require_login

  def show
    if (!session.key?("user_id"))
      redirect_to login_path
    else
      @user_jobs = UserJob.where(user_id: session["user_id"]).order("job_start DESC")
      @educations = Education.where(user_id: session["user_id"]).order("edu_start DESC")
      @user_careers = UserCareer.where(user_id: session[:user_id]).order("career_start ASC").all.paginate(:page => params[:page], :per_page => 10)
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
