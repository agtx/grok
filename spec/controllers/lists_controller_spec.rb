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
    
    describe "for today" do
      
      before(:each) do
        @attr = { :name => Date.today }
      end

      it "should create a new list" do
        lambda do
        post :create, :list => @attr
        end.should change(List, :count).by(1)
      end
      
      it "should re-render the home page" do
        post :create, :list => @attr
        response.should redirect_to lists_path(:list_id => 1)
      end
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
