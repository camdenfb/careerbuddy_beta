class HomeController < ApplicationController

  def show
    if (!session.key?("user_id"))
      redirect_to login_path
    end
  end

  def login
    if (session.key?("user_id"))
      redirect_to root_path
    end
  end

end
