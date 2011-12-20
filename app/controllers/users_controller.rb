class UsersController < ApplicationController
  before_filter :authenticate_user!


  def index
    @users = User.paginate(:page => params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def show
    @user = current_user
    @lists = @user.lists.paginate(:page => params[:page])
  end

end 
