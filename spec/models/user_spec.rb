require 'spec_helper'

describe User do

  before(:each) do
    @attr = { 
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require an Email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end
  
  it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
  it "should reject email addresses identical up to the case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end  
end  
  # describe "admin attribute" do
  # 
  #   before(:each) do
  #     @user = User.create!(@attr)
  #   end
  # 
  #   it "should respond to admin" do
  #     @user.should respond_to(:admin)
  #   end
  # 
  #   it "should not be an admin by default" do
  #     @user.should_not be_admin
  #   end
  # 
  #   it "should be convertible to an admin" do
  #     @user.toggle!(:admin)
  #     @user.should be_admin
  #   end
  # end    



