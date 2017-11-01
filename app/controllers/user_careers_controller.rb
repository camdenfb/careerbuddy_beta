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
      redirect_to user_careers_path, :notice => "Career added"
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
    redirect_to user_careers_path, :notice => "Career deleted"
  end

  def career_dashboard
    @user_career = UserCareer.find(params[:id])
    session[:selected_career] = @user_career.id
    @user_jobs = UserJob.where(user_career_id: @user_career.id)

    if Rails.env.development?
      @connection = ActiveRecord::Base.establish_connection(
          adapter: "sqlite3",
          database: "db/development.sqlite3"
      )
    elsif Rails.env.production?
      @connection = ActiveRecord::Base.establish_connection(
          :adapter  => "postgresql",
          :host     => "ec2-174-129-253-133.compute-1.amazonaws.com",
          :username => "bixsnitgldzbdm",
          :password => "8da72462b4a7562d73f7846d0d039dac86d44ae846520d87c2cbaa72bc14789e",
          :port     => "5432",
          :database => "d3isejcb2j35k"
      )
    end

    skill_hours = "select career_skills.skill_id, career_skills.weight, skill_hours.totalhours from career_skills, (select activity_skills.skill_id as skillid, sum(activities.hours) as totalhours from activities, activity_skills where activities.id = activity_skills.activity_id and activities.user_id = '" + session[:user_id].to_s + "' group by activity_skills.skill_id) as skill_hours where career_skills.skill_id = skill_hours.skillid and career_skills.user_career_id = '" + session[:selected_career].to_s + "';"
    @results = @connection.connection.execute(skill_hours)

    @career_hours = 0;
    @results.each do |a|
      if(a["weight"] == "Required")
        @career_hours+= a["totalhours"] * (Setting.find(1).required_skill_multiplier/100)
      elsif(a["weight"] == "Preferred")
        @career_hours+= a["totalhours"] * (Setting.find(1).preferred_skill_multiplier/100)
      elsif(a["weight"] == "Desired")
        @career_hours+= a["totalhours"] * (Setting.find(1).desired_skill_multiplier/100)
      end
    end

    @career_progress = (@career_hours / Setting.find(1).total_career_hours) * 100

  end

end
