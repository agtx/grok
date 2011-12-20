class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :new, :show]


  def index
    # @title = "To-do lists"
    # @lists = List.paginate(:page => params[:page])
    # @users = User.all
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def update
     @user = User.find(params[:id])
     if @user.update_attributes(params[:user])
       flash[:success] = "Profile updated."
       redirect_to @user
     else
       render 'edit'
     end
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

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @user.password, @user.password_confirmation = nil
      @title = "Sign up"
      render 'new'      
    end
  end
end 
