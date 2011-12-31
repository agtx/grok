require 'spec_helper'

describe PagesController do
  render_views

  describe "GET :home" do
    it "should be successful" do
      get :home
      response.should be_success 
    end
    
    describe "for non-signed-in users" do
      
      it "should not redirect to the lists index" do
        get :home, :id => @user
        response.should_not redirect_to(lists_path)
      end
      
      describe "for signed-in users" do
        
        before(:each) do
          @user = test_sign_in(Factory(:user))
        end
        
        it "should redirect to lists index" do
          get :home, :id => @user
          response.should redirect_to('/lists?list_position=1')
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
