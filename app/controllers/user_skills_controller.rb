class UserSkillsController < ApplicationController

  def index
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
    user_skills = "select activity_skills.skill_id as skillid, sum(activities.hours) as totalhours from activities, activity_skills where activities.id = activity_skills.activity_id and activities.user_id = '" + session[:user_id].to_s + "' group by activity_skills.skill_id, activities.user_id"
    @results = @connection.connection.execute(user_skills)

  end

end
