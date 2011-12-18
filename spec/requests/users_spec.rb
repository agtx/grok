require 'spec_helper'

describe "Users" do
  
  describe "signup" do
  
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit new_user_registration_path
          fill_in "Email",                   :with => ""
          fill_in "Password",                :with => ""
          fill_in "Password confirmation",   :with => ""
          click_button
          response.should render_template('devise/registrations/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end      
    end
    
     describe "success" do

        it "should make a new user" do
          lambda do
            visit new_user_registration_path
            fill_in "Email",                   :with => "intuser@example.com"
            fill_in "Password",                :with => "foobar"
            fill_in "Password confirmation",   :with => "foobar"
            click_button
            response.should have_selector("div#flash_notice",
                                          :content => "successfully")
            response.should render_template('users/show')
          end.should change(User, :count).by(1)
        end
     end
  end
      
  describe "sign in/out" do

      describe "failure" do
      
        it "should not sign a user in" do
          visit new_user_session_path
          fill_in :email,      :with => ""
          fill_in :password,   :with => ""
          click_button
          response.should have_selector("div#flash_alert", 
                                        :content => "Invalid")
        end
      end
      
      describe "success" do
        it "should sign a user in and out" do
          user = Factory(:user, :email => Factory.next(:email))
          visit new_user_session_path
          fill_in "Email",         :with => user.email
          fill_in "password",      :with => user.password
          click_button
          controller.should be_signed_in
          click_link "Sign out", :method => :delete 
          controller.should_not be_signed_in
        end
      end
    end
end

