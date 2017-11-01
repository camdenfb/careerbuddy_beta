class CareersController < ApplicationController
  def allowed_params
    params.require(:career).permit(:career_title, :career_description)
  end

  def index
    if params[:search]
      @careers = Career.search(params[:search]).order("career_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    else
      @careers = Career.order("career_title ASC").all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @career = Career.new
  end

  def create
    @career = Career.create(allowed_params)

    if @career.save
      redirect_to careers_path, :notice => "Career added"
    else
      render "new"
    end
  end

  def edit
    @career = Career.find(params[:id])
  end

  def update
    @career = Career.find(params[:id])
    if @career.update_attributes(allowed_params)
      redirect_to careers_path, :notice => "Career updated"
    else
      render "edit"
    end
  end

  def destroy
    @career = Career.find(params[:id])
    @career.destroy
    redirect_to careers_path, :notice => "Career deleted"
  end
end
