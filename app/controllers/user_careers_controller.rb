class UserCareersController < ApplicationController


  def set_user_career
    @user_career = UserCareer.find(params[:id])
  end

  def allowed_params
    params.require(:user_career).permit(:career_id, :career_start, :career_end, :career_description, career_skills_attributes: [:id, :skill_id, :weight, :user_career_id, :_destroy])
  end

  def index
    @user_careers = UserCareer.where(user_id: session[:user_id]).order("career_start ASC").all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user_career = UserCareer.new
  end

  def create
    @user_career = UserCareer.create(allowed_params)
    @user_career.user_id = session[:user_id]

    if @user_career.save
      redirect_to root_path, :notice => "Career added"
    else
      render "new"
    end

  end

  def edit
    @user_career = UserCareer.find(params[:id])
  end

  def update
    @user_career = UserCareer.find(params[:id])
    #distinguish edit career with edit career_skill
    if @user_career.update_attributes(allowed_params)
      redirect_to career_dashboard_path(session[:selected_career]), :notice => "Career updated"
    else
      redirect_to career_dashboard_path(session[:selected_career]), :notice => "Error"
    end
  end

  def destroy
    @user_career = UserCareer.find(params[:id])
    @user_career.destroy
    redirect_to root_path, :notice => "Career deleted"
  end

  def career_dashboard
    @user_career = UserCareer.find(params[:id])
    session[:selected_career] = @user_career.id
    @user_jobs = UserJob.where(user_career_id: @user_career.id).order("job_start DESC")


  end

end
