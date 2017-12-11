class UserCompetenciesController < ApplicationController

  def index
    if Rails.env.development?
      @connection = ActiveRecord::Base.establish_connection(
          adapter: "sqlite3",
          database: "db/development.sqlite3"
      )
    elsif Rails.env.production?
      @connection = ActiveRecord::Base.establish_connection(
          :adapter  => "postgresql",
          :host     => "ec2-23-21-220-32.compute-1.amazonaws.com",
          :username => "nuuytljfdymvyu",
          :password => "4adbbec8515ec7f337673a5e76f1c92b470ba431b472a7b0c9a3ac3f887976ba",
          :port     => "5432",
          :database => "dfnme5l6or8t88"
      )
    end
    user_competencies = "select activity_competencies.competency_id as competencyid, sum(activities.hours) as totalhours from activities, activity_competencies where activities.id = activity_competencies.activity_id and activities.user_id = '" + session[:user_id].to_s + "' group by activity_competencies.competency_id"
    @results = @connection.connection.execute(user_competencies)

  end

end
