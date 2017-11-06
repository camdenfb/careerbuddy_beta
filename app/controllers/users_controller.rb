class UsersController < ApplicationController

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :summary, :location, :email, :contact_no, :website)
  end

  def edit
    @user = User.find(session["user_id"])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(allowed_params)
      redirect_to root_path, :notice => "Profile updated"
    else
      render "edit"
    end
  end
end
