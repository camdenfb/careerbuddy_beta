class SettingsController < ApplicationController
  def allowed_params
    params.require(:setting).permit(:required_skill_multiplier, :preferred_skill_multiplier, :desired_skill_multiplier, :total_career_hours, :total_skill_hours, :hours_in_a_day)
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(allowed_params)
      redirect_to root_path, :notice => "Settings updated"
    else
      render "edit"
    end
  end
end
