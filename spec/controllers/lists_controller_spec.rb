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
  end
  
  describe "POST create" do
    
    before(:each) do
     @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = ""
      end
      
      # it "should not create list" do               -------fix devise validation for rspec in order for this to work
      #   lambda do
      #     @list = Factory(:list, :user => @user, :name => @attr)
      #     post :create, :id => @list, :user_id => @list
      #   end.should_not change(List, :count)
      # end
      
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
      
      # describe "daily list creation" do
    
      #Testing cronjobs is proving too time consuming and will be put in later
      
      #   it "should display named after the current day" do
      #     post :create, :id => @list, :user_id => @list, @list.name => @attr
      #     response.should redirect_to(root_path)
      #     response.should have_selector('h1', :content => Time.now.strftime("%A"))
      #   end
      # end
      
      describe "list for tomorrow" do
        
        it "should re-render the home page" do
          post :create, :id => @list, :user_id => @list, @list.name => @attr
          response.should redirect_to root_path
        end
      end
    end
  end
    # 
    # describe "GET :index" do
    #   
    #   before(:each) do
    #    @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
    #    @list = Factory(:list, :user => @user)
    #    @list2 = Factory(:list, :user => @user, :name => "vadf")
    #    @lists = [@list, @list2]
    #    35.times do
    #      @lists << Factory(:list, :user => @user)
    #     end  
    #   end
    #   
    #   it "should be successful" do
    #     get :index, :id => @user 
    #     response.should be_success 
    #   end
    # 
    #   it "should have the right title" do
    #     get :index, :id => @user 
    #     response.should have_selector("title",
    #                                   :name => @base_title + " | To-do lists")
    #   end
    #   
    #   it "should have an element for each user" do
    #     get :index , :id => @user 
    #     List.paginate(:page => 1).each do |list|
    #       response.should have_selector('h2', :name => list.name)        
    #     end
    #   end
    #   
    #   it "should paginate lists" do
    #     get :index
    #     response.should have_selector("div.pagination")
    #   end
    # end
    # 
    # 
    # describe "GET 'show'" do
    # 
    #    before(:each) do
    #      @user = test_sign_in(Factory(:user))
    #      @list = Factory(:list, :user => @user)
    #    end
    #    
    #    it "should be successful" do
    #       get :show, :id => @list
    #       response.should be_success
    #     end
    # 
    #     it "should find the right list" do
    #      get :show, :id => @list
    #      assigns(:list).should == @list
    #     end
    #     
    #     it "should include the list's name" do
    #       get :show, :id => @list
    #       response.should have_selector("h2", :name => @list.name)
    #     end
    # end
    # 
    # describe "DELETE 'destroy'" do
    #   
    #   before(:each) do
    #      @user = test_sign_in(Factory(:user))
    #      @list = Factory(:list, :user => @user)
    #   end
    #   
    #   it "should destroy the list" do
    #     lambda do
    #       delete :destroy, :id => @list
    #     end.should change(List, :count).by(-1)
    #   end
    #   
    #   it "should redirect to the lists page" do
    #     delete :destroy, :id => @list
    #     response.should redirect_to(lists_path) 
    #   end
    # end
end