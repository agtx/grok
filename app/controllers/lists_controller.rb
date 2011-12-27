class ListsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js
   
  
  def index
    @user  = current_user
    @lists = @user.lists.paginate(:page => params[:page])
  end  
  
  def create
    @list = current_user.lists.build(params[:list])
    if @list.save
      cookies[:current_list_id] = {:value => @list.id, :expires => 5.minutes.from_now }
      self.current_list = @list
      respond_with(@list) do |format|
        format.html { redirect_to root_path, notice: 'list created.' }
      end
    else
      self.current_list = nil
      respond_with(@list) do |format|
      format.html { render "pages/home" }
      end
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
