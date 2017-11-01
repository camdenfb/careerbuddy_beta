class SkillsController < ApplicationController

  def allowed_params
    params.require(:skill).permit(:skill_title, :skill_description)
  end

  def index
    if params[:search]
      @skills = Skill.search(params[:search]).order("skill_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    else
      @skills = Skill.order("skill_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @skill = Skill.new
  end


  def create
    @skill = Skill.create(allowed_params)

    if @skill.save
      redirect_to skills_path, :notice => "Skill added"
    else
      render "new"
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update_attributes(allowed_params)
      redirect_to skills_path, :notice => "Skill updated"
    else
      render "edit"
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path, :notice => "Skill deleted"
  end

end
