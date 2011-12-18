require 'spec_helper'

describe "lists" do

  describe "create list" do
    
    describe "failure" do
      
      it "should not make a new list" do
        lambda do
          visit new_path
          fill_in "name",            :with => ""
          fill_in "description",     :with => ""
          click_button
          response.should render_template('lists/new')
          response.should have_selector("div.flash.error")
        end.should_not change(List, :count)
      end
      
    describe "success" do
        
        it "should make a new list" do
          lambda do
            visit new_path
            fill_in "name",         :with => "study"
            fill_in "description",  :with => "learn how to read"
            click_button
            response.should render_template('lists/show') 
          end.should change(List, :count).by(1)
        end
    end
      
    end
    
  end

end
