require 'spec_helper.rb'

describe Comment do
  
  before(:each) do
    @arr = {
      :commenter => "Commenter 01",
      :body => "Body 01",
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Comment.create!(@arr)
  end
  
  it "should require commenter" do
    commenter = Comment.new(@arr.merge(:commenter => ""))
    commenter.should_not be_valid
  end
  
  it "should accept commenter" do
    commenter = Comment.new(@arr.merge(:commenter => "Commenter 01"))
    commenter.should be_valid
  end
  
  it "should require body" do
    body = Comment.new(@arr.merge(:body => ""))
    body.should_not be_valid
  end
  
  it "should accept body" do
    body = Comment.new(@arr.merge(:body => "Body 01"))
    body.should be_valid
  end
  
  describe "Respond" do
    
    before(:each) do
      @comments = Comment.new(@arr.merge(:body => ""))
    end
    
    it "should have a commenter attribute" do
      @comments.should respond_to(:commenter)
    end
    
    it "should have a body attribute" do
      @comments.should respond_to(:body)
    end
    
  end
  
end
