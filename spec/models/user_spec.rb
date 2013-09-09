require 'spec_helper'

describe User do
  
  before(:each) do
    @arr = {
      :name => "demo",
      :password => "123456",
      :email => "example@mulodo.com",   
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@arr)
  end
  
  it "should require an email address" do
    no_email = User.new(@arr.merge(:email => ""))
    no_email.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    mail = User.new(@arr.merge(:email => "vu.son@mulodo.com"))
    mail.should be_valid
  end
  
  it "should require - name" do
    name = User.new(@arr.merge(:name => ""))
    name.should_not be_valid
  end
  
  it "should accept valid name" do
    name = User.new(@arr.merge(:name => "vu.son"))
    name.should be_valid
  end
  
  it "should require password" do
    password = User.new(@arr.merge(:hashed_password => ""))
    password.should_not be_valid
  end
  
  it "should accept valid password" do
    password = User.new(@arr.merge(:password => "123456"))
    password.should be_valid
  end
  
  describe "password" do
    
    before(:each) do
      @user = User.new(@arr.merge(:hashed_password => ""))  
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end
    
    it "should have a name attribute" do
      @user.should respond_to(:name)
    end
    
    it "should have a email attribute" do
      @user.should respond_to(:email)
    end
    
    
    
  end
  
end