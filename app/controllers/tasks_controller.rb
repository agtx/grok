class TasksController < ApplicationController
  before_filter :authenticate
  before_filter :find_list
  before_filter :find_task
  
  attr_accessor :completed
  
  respond_to :html, :xml, :js


  def create
    @user = current_user
    @list = @user.Lists.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:success] = "Task created"
      redirect_to list_url(@list)
    else
      flash[:failure] = "Could not add list"
      redirect_to list_url(@list)
    end
  end
  
  def complete
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_url(@list)
  end

  def destroy
    @task = find_task    
    @task.destroy
  end
  
  private
  
  
  def find_list
    @list = List.find(params[:list_id])
  end
  
  def find_task
    @list = find_list
    @task = @list.tasks.find(params[:id])
  end  
end

