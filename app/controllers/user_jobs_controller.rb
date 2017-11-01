class UserJobsController < ApplicationController
  def allowed_params
    params.require(:user_job).permit(:job_title, :job_start, :job_end, :job_description, :company)
  end

  def new
    @user_job = UserJob.new
  end

  def create
    @user_job = UserJob.create(allowed_params)
    @user_job.user_career_id = session[:selected_career]
    @user_job.user_id = session[:user_id]

    if @user_job.save
      redirect_to career_dashboard_path(session[:selected_career]), :notice => "Job added"
    else
      render "new"
    end

  end

  def edit
    @user_job = UserJob.find(params[:id])
  end

  def update
    @user_job = UserJob.find(params[:id])
    #@user_job.user_id = session[:user_id]
    if @user_job.update_attributes(allowed_params)
      redirect_to career_dashboard_path(session[:selected_career]), :notice => "Job updated"
    else
      render "edit"
    end
  end

  def destroy
    @user_job = UserJob.find(params[:id])
    @user_job.destroy
    redirect_to career_dashboard_path(session[:selected_career]), :notice => "Job deleted"
  end

end
