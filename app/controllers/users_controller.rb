class UsersController < ApplicationController

  before_filter :authenticate_user!, :except => [:create, :new, :show]


  def index
    @title = "To-do lists"
    @lists = List.paginate(:page => params[:page])
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
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

  private
        # 
        # def correct_user
        #   @user = User.find(params[:id])
        #   redirect_to(root_path) unless current_user?(@user)
        # end
    
end
