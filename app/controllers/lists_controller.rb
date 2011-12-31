class ListsController < ApplicationController
  before_filter :authenticate_user!

  
  def index
    @user = current_user
    @list = params[:list_position] ? current_user.lists.find_by_position(params[:list_position]) : 
                                     List.default_location(@user).first
  end
  
  def create
    @user = current_user
    @list = @user.lists.build(params[:list])
    if @list.save
      redirect_to lists_path(:list_position => @list.position)
    else
      render lists_path(:list_position => @list.higher_item), notice: "fail"
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

