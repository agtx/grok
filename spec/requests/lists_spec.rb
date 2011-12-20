require 'spec_helper'

describe "lists" do
  
  before(:each) do
    user = test_sign_in(Factory(:user))
    visit new_user_session_path
    fill_in :email,     :with => user.email
    fill_in :password,  :with => user.password
    click_button
  end
  
  describe "creation" do
    
    describe "success" do
      
      it "should generate a new list" do
        lambda do
          visit root_path
          click_button "plan for tomorrow"
          response.should have_selector("h1", :content => Date.tomorrow.strftime("%A"))
        end.should change(List, :count).by(1)
      end
    end
  end
  
  describe "navigation" do
    
    it "should be able to navigate between lists"
  
  end
end
