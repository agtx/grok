require 'spec_helper'

describe PagesController do
  render_views

  describe "GET :home" do
    it "should be successful" do
      get :home
      response.should be_success 
    end
  end

    # describe "for signed-in users" do
    #   
    #   before(:each) do
    #     @user = test_sign_in(Factory(:user))
    #     other_user = Factory(:user, :email => Factory.next(:email), :username => Factory.next(:username))
    #     other_user.follow!(@user)
    #   end
    #   
    #   it "should display the micropost count with proper pluralization" do
    #     1.times { Factory(:micropost, :user => @user, :content => "foo" ) }
    #     get :home, :id => @user
    #     response.should have_selector('.user_info', 
    #                                   :content => @user.microposts.count.to_s)
    #     response.should have_selector('.microposts', 
    #                                   :content => 'micropost')
    #     10.times { Factory(:micropost, :user => @user, :content => "foo" ) }
    #     get :home, :id => @user
    #     response.should have_selector('.microposts', 
    #                                          :content => 'microposts')
    #   end
    #   
    #    it "should paginate microposts" do
    #       35.times { Factory(:micropost, :user => @user, :content => "foo") }
    #       get :home, :id => @user
    #       response.should have_selector('div.pagination')
    #    end
    #   
    #   it "should have the right follower/following counts" do
    #     get :home
    #     response.should have_selector('a', :href => following_user_path(@user),
    #                                        :content => "0 following")
    #     response.should have_selector('a', :href => followers_user_path(@user),
    #                                        :content => "1 follower")
    #   end
    # end
  #   
  #   describe "for non-signed-in users" do
  #     
  #     it "should not display micropost interface" do
  #       get :home, :id => @user
  #       response.should_not have_selector('.micropost', :content => "What's up?")
  #     end
  #     
  #     it "should not display the user sidebar" do
  #       get :home, :id => @user
  #       response.should_not have_selector('.sidebar')
  #     end
  #   end
  # end



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
