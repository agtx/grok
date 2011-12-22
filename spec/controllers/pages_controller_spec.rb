require 'spec_helper'

describe PagesController do
  render_views

  describe "GET :home" do
    it "should be successful" do
      get :home
      response.should be_success 
    end
    
    describe "for non-signed-in users" do
      
      it "should not display lists interface" do
        get :home, :id => @user
        response.should_not have_selector('.Todaylist')
      end
      
      it "should not display the lists navigation" do
        get :home, :id => @user
        response.should_not have_selector('div#list_nav')
      end
      
      describe "for signed-in users" do
        
        before(:each) do
          @user = test_sign_in(Factory(:user))
        end
        
        it "should display lists interface" do
          get :home, :id => @user
          response.should have_selector('.Todaylist')
        end

        it "should have a link to plan for tomorrow" do
          get :home, :id => @user
          response.should have_selector('div#actions', :content => "Plan for tomorrow")
        end
      end
    end    
  end



  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

  end
  
  describe "GET 'Help" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end 
  end
end
