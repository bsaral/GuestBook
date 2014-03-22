class SessionsController < ApplicationController
  def new
  	redirect_to people_path and return if current_user
  end
  def create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to people_path
  	else
  		flash[:error_admin] = "Kullanici adin ve/veya parolan hatali"
  		redirect_to admin_path

  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to admin_path
  end
end
