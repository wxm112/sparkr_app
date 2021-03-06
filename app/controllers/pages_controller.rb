class PagesController < ApplicationController
  
  def home
    @users = User.all
    @username = User.find_by username: params[:username]

    if @current_user
      @lat_and_long = "" + @current_user.latitude.to_s + ", " + @current_user.longitude.to_s
      @nearby_users = User.near(@lat_and_long, 30, :order => 'distance')
      
    end
  end   
end

