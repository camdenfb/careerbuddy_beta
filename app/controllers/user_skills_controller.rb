class UserSkillsController < ApplicationController

  def index
    @connection = ActiveRecord::Base.establish_connection(
        adapter: "sqlite3",
        database: "db/development.sqlite3"
    )
    user_skills = "select activity_skills.skill_id as skillid, sum(activities.hours) as totalhours from activities, activity_skills where activities.id = activity_skills.activity_id and activities.user_id = '" + session[:user_id].to_s + "' group by activity_skills.skill_id, activities.user_id"
    @results = @connection.connection.execute(user_skills)

  end

end
