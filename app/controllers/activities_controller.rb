class ActivitiesController < ApplicationController

  def allowed_params
    params.require(:activity).permit(:activity_start, :activity_type, :job_id, :_time, :_time_unit, :activity_details, :state, activity_competencies_attributes: [:id, :competency_id, :activity_id, :_destroy])
  end

  def index
    @activities = Activity.where(user_id: session[:user_id]).where(state: "Real").all
    @templates = Activity.where(user_id: session[:user_id]).where(state: "Template").all
    #@activities = Activity.order("career_title ASC").all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @activity = Activity.new
  end

  def create
    #modify allowed params
    @unit = allowed_params[:_time_unit].to_s
    @time = compute_hours(@unit) * allowed_params[:_time].to_f
    temp_hash = allowed_params
    if temp_hash["activity_type"] == "Personal"
      temp_hash["job_id"] = nil
    end
    temp_hash.delete("_time")
    temp_hash.delete("_time_unit")
    temp_hash.merge!(hours: @time)
    temp_hash.merge!(user_id: session[:user_id])
    temp_hash.merge!(state: "Real")
    @activity = Activity.create(temp_hash)

    if @activity.save
      redirect_to activities_path, :notice => "Activity added"
    else
      render "new"
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    @activity._time = @activity.hours
    @activity._time_unit = "Hours"
  end

  def update
    @activity = Activity.find(params[:id])

    @unit = allowed_params[:_time_unit].to_s
    @time = compute_hours(@unit) * allowed_params[:_time].to_f
    temp_hash = allowed_params
    if temp_hash["activity_type"] == "Personal"
      temp_hash["job_id"] = nil
    end
    temp_hash.delete("_time")
    temp_hash.delete("_time_unit")
    temp_hash.merge!(hours: @time)
    temp_hash.merge!(user_id: session[:user_id])

    #distinguish edit activity with edit activity_skill
    if @activity.update_attributes(temp_hash)
      redirect_to activities_path, :notice => "Activity updated"
    else
      render "edit"
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path, :notice => "Activity deleted"
  end

end
