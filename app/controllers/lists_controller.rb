class ListsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @title = "To-do lists"
    @user  = User.find(params[:user_id])
    @lists = List.paginate(:page => params[:page])
  end  
  
  def create
    @user = User.find(params[:user_id])
    @date = Select_day(Time.now).to_s
    @today_list = @user.lists.build(params[:list, :name => @date])
    # if @list.save 
    #   flash[:success] = "New list created"
    #   redirect_to @list
    # else
    #   flash[:error] = "List must have a name"
    #   redirect_to root_path
    # end
    # @today_list = @list.name params[:name => @date])
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


    # 
    # private
    #   
    # def authorized_user
    #   @user  = current_user
    #   @list = @user.lists.find_by_id(params[:id])
    #   redirect_to root_path if @list.nil?
    # end