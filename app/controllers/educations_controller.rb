class EducationsController < ApplicationController
  def allowed_params
    params.require(:education).permit(:school, :level, :degree, :field_of_study, :edu_start, :edu_end, :edu_description)
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.create(allowed_params)
    @education.user_id = session["user_id"]

    if @education.save
      redirect_to root_path, :notice => "Education added"
    else
      render "new"
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update_attributes(allowed_params)
      redirect_to root_path, :notice => "Education updated"
    else
      render "edit"
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to root_path, :notice => "Education deleted"
  end
end
