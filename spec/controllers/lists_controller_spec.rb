require 'spec_helper'

describe ListsController do
  render_views
  
  describe "access control" do
    it "should deny access to 'create'" do
      post :create, :id => 1, :user_id => 1
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1, :user_id => 1
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'index'" do
      get :index, :id => 1, :user_id => 1
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "POST create" do
    
    before(:each) do
     @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = ""
      end
      
            it "should not create list" do
              lambda do
                @list = Factory(:list, :user => @user, :name => @attr)
                post :create, :id => @list, :user_id => @list
              end.should_not change(List, :count)
            end
            
      it "should re-render the home page" do
        post :create, :id => @list, :user_id => @list, :name => @attr
          response.should redirect_to root_path
      end
    end
    
    describe "success" do
      
      before(:each) do
        @attr = Time.now.strftime("%A")        
        @list = Factory(:list, :user => @user)
        10.times { Factory(:list, :user => Factory(:user, 
                            :email => Factory.next(:email)), :name => @attr)}
      end

      it "should create a new list" do
        lambda do
        post :create, :id => @list, :user_id => @list, @list.name => @attr
        end.should change(List, :count).by(1)
      end
    end  
  
      # describe "daily list creation" do
    
      #Testing cronjobs is proving too time consuming and will be put in later
        
      #   it "should display named after the current day" do
      #     post :create, :id => @list, :user_id => @list, @list.name => @attr
      #     response.should redirect_to(root_path)
      #     response.should have_selector('h1', :content => Time.now.strftime("%A"))
      #   end

      
    describe "list for tomorrow" do
      
      before(:each) do
        @attr = Date.tomorrow.strftime("%A")        
        @list = Factory(:list, :user => @user)
      end
      
      it "should re-render the home page" do
        post :create, :id => @list, :user_id => @list, @list.name => @attr
        response.should redirect_to root_path
      end
      
      it "should have tomorrow's title'" do
        post :create, :id => @list, :user_id => @list, @list.name => @attr
        response.should have_selector('h1', @attr)
      end
    end
  end


  
  describe "lists associations" do
    
    before(:each) do
      @user = Factory(:user)
      @list1 = Factory(:list, :user => @user, :created_at => 1.day.ago)
      @list2 = Factory(:list, :user => @user, :created_at => 1.hour.ago)
    end
    
    it "should have a list attribute" do
      @user.should respond_to(:lists)
    end
    
    it "should destroy associated lists" do
      @user.destroy
      [@list1, @list2].each do |list|
        List.find_by_id(list.id).should be_nil
      end
    end
    
    it "should have the right lists in the the right order" do
      @user.lists.should == [@list2, @list1]
    end
  end
  
  describe "DELETE 'destroy'" do
    
    before(:each) do
       @user = test_sign_in(Factory(:user))
       @list = Factory(:list, :user => @user)
    end
    
    it "should destroy the list" do
      lambda do
        delete :destroy, :id => @list
      end.should change(List, :count).by(-1)
    end
    
    it "should redirect to the lists page" do
      delete :destroy, :id => @list
      response.should redirect_to(lists_path) 
    end
  end
end
