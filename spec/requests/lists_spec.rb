require 'spec_helper'

describe "lists" do
  
  before(:each) do
    @user = Factory(:user)
    visit new_user_session_path
    click_button
    fill_in :email,     :with => @user.email
    fill_in :password,  :with => @user.password
    click_button
  end
  
  describe "creation" do
    
    describe "success" do
      
      it "should generate a new list" do
        lambda do
          visit root_path
          click_button "plan for tomorrow"
          response.should have_selector('div#current_list')
        end.should change(List, :count).by(1)
      end
      
      it "should not generate a new list when one already exists" do
        lambda do
          visit root_path
          click_button "plan for tomorrow"
          response.should have_selector('div#current_list')
          click_link "back"
          click_link "plan for tomorrow"
        end.should change(List, :count).by(1)
      end
      
      it "should generate a new list even after navigating back and forward" do
        lambda do
          visit root_path
          click_button "plan for tomorrow"
          click_link "back"
          click_link "plan for tomorrow"
          click_button "plan for tomorrow"
        end.should change(List, :count).by(2)
      end
    end
  end
  
  describe "navigation" do  
  
    describe "correct list display" do
      it "should display the relevant date-based list name" do
        visit root_path
        click_button "plan for tomorrow"
        response.should have_selector('h3', :content => Date.today.advance(:days => 1).strftime("%A"))

        click_button "plan for tomorrow"
        response.should have_selector('h3', :content => Date.today.advance(:days => 2).strftime("%A"))
        response.should have_selector('div.actions')

        click_link "back"
        response.should have_selector('h3', :content => Date.today.advance(:days => 1).strftime("%A"))      
        response.should_not have_selector('div.actions')
        response.should have_selector('a', :content => "Plan for tomorrow")

        click_link "plan for tomorrow"
        response.should have_selector('h3', :content => Date.today.advance(:days => 2).strftime("%A"))

        click_button "plan for tomorrow"
        response.should have_selector('h3', :content => Date.today.advance(:days => 3).strftime("%A"))
      end
      
      it "should display today's list by default at root/signup" do
        visit root_path
        click_button "plan for tomorrow"
        response.should have_selector('h3', :content => Date.today.advance(:days => 1).strftime("%A"))
        
        click_link "Sign out", :method => :delete 
        click_link "Sign in"
        fill_in :email,     :with => @user.email
        fill_in :password,  :with => @user.password
        click_button "Sign in"        
        response.should have_selector('h3', :content => Date.today.strftime("%A"))      

        click_link "plan for tomorrow"
        click_link "grok"
        response.should have_selector('h3', :content => Date.today.strftime("%A"))      
      end
    end
    
    describe "back button" do
      
      it "should not have a back link when user logs on" do
        visit root_path
        response.should_not have_selector('a', :content => "back")
      end
      
      it "should have a back link when navigating except for 'today'" do
        visit root_path
        click_button "plan for tomorrow"
        response.should have_selector('a', :content => "back")
        
        click_button "plan for tomorrow"
        response.should have_selector('a', :content => "back")
        
        click_link "back"
        response.should have_selector('a', :content => "back")
        
        click_link "plan for tomorrow"
        response.should have_selector('a', :content => "back")
        
        click_link "back"
        click_link "back"
        response.should_not have_selector('a', :content => "back")
      end
    end  
  end
end
