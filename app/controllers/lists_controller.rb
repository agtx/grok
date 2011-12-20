class ListsController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :authorized_user
  respond_to :html, :xml
   
  
  def index

      @user  = current_user
      @lists = @user.lists.paginate(:page => params[:page])

  end  
  
  def create
    @user = current_user
    # @list = @user.lists.find(params[:list])
    # respond_with @user
    @tomorrow_list = build_list_for_tomorrow(@user)
    if @tomorrow_list.save 
     redirect_to root_path
    else
      flash[:error] = "List must have a name"
      redirect_to root_path
    end
  end
  
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:success] = "List updated"
      redirect_to @list
    else
      @title = "Edit list"
      render 'edit'
    end  
  end
  
  def destroy
    @user = current_user
    @list = @user.lists.find(params[:id])
    if @list.destroy 
      flash[:success] = "List destroyed"
    else
      flash[:error] = "Could not destroy list"
    end
    redirect_to lists_path
  end
end


    
  private
    
  def authorized_user
    @user  = current_user
    @list = @user.lists.find_by_id(params[:id])
    redirect_to root_path if @list.nil?
  end