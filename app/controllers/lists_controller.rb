class ListsController < ApplicationController
  before_filter :authenticate_user!

  
  def index
    @user = current_user
    if @user.lists.empty?
      @list = @user.lists.create!(:name => Date.today)
    else                 
      @list = params[:list_id] ? List.find(params[:list_id]) : List.default_location(@user).first
    end
  end
  
  def create
    @user = current_user
    @list = @user.lists.build(params[:list])
    if @list.save
     self.current_list = @list
      redirect_to lists_path(:list_id => @list.id)
    else
      render lists_path(:list_id => @list.higher_item), notice: "fail"
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:success] = "List updated"
      redirect_to list_home_path
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

