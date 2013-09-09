require 'spec_helper'
require 'capybara/rspec'

describe "user page" do
  it "displays the user's username after successful login" do
    user = FactoryGirl.create(:user)
    visit "/users/login"
    fill_in "user[username]", :with => user.name
    fill_in "user[password]", :with => '123456'
    click_button "Login"
    page.should have_content('Listing user')
    
    visit "/users/#{user.id}"
    fill_in "comment[commenter]", :with => "Commenter 01"
    fill_in "comment[body]", :with => "Body 01"
    click_button "Create Comment"
    page.should have_content('Body 01')
  end

  it "displays error message when input invalid username or password" do
    user = FactoryGirl.create(:user)
    visit "/users/login"
    fill_in "user[username]", :with => 'abcd'
    fill_in "user[password]", :with => '123456'
    click_button "Login"
    page.should have_content('Sign In')
    
    visit "/users/#{user.id}"
    fill_in "comment[commenter]", :with => "Commenter 01"
    fill_in "comment[body]", :with => "Body 1"
    click_button "Create Comment"
    page.should have_content("Body 1")
  end
  
  it "displays the user's username after successfull register" do
    visit "/users/new"
    fill_in "user[name]", :with => 'test_02'
    fill_in "user[password]", :with => '123456'
    fill_in "user[email]", :with => 'vo.yen@mulodo.com'
    click_button "Save User"
    page.should have_content('test_02')
  end
  
  it "new post" do
    visit "/users/login"
    fill_in "user[username]", :with => "test01"
    fill_in "user[password]", :with => "123456"
    click_button("Login")
    page.should have_content('Listing user')
    
    visit "/blogs"
    click_link("New")
    
    visit "/blogs/new"
    fill_in "blogs[title]", :with => "Title 01"
    fill_in "blogs[content]", :with => "Content 1"
    click_button "Save Blog"
    page.should have_content('Title 01')
    
  end
end