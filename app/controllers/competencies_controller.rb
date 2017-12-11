class CompetenciesController < ApplicationController
  def allowed_params
    params.require(:competency).permit(:competency_title, :competency_description, competency_skills_attributes: [:id, :skill_id, :competency_id, :_destroy])
  end

  def index
    if params[:search]
      @competencies = Competency.search(params[:search]).order("competency_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    else
      @competencies = Competency.order("competency_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @competency = Competency.new
  end

  def create
    @competency = Competency.create(allowed_params)

    if @competency.save
      redirect_to competencies_path, :notice => "Competency added"
    else
      render "new"
    end
  end

  def edit
    @competency = Competency.find(params[:id])
  end

  def update
    @competency = Competency.find(params[:id])
    if @competency.update_attributes(allowed_params)
      redirect_to competencies_path, :notice => "Competency updated"
    else
      render "edit"
    end
  end

  def destroy
    @competency = Competency.find(params[:id])
    @competency.destroy
    redirect_to competencies_path, :notice => "Competency deleted"
  end


end
