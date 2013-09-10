def create_visitor
  @arr ||= { :name => "cucumberTest",
  :email => "cucumber@mulodo.com",
  :password => "123456",
  }
end

def create_arr_comment
  @arrcomment ||= {
    :title => "Title 01",
    :content => "Content 01",
  }
end

def create_blog
  @arrblog ||= {
    :title => "Title 01",
    :content => "Content 01",
  }
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @arr)
end

def login_user
  visit "/users/login"
  fill_in "user[username]", :with => @arr[:name]
  fill_in "user[password]", :with => @arr[:password]
  click_button "Login"
end

def register_user
  visit "/users/new"
  fill_in "user[name]", :with => @arr[:name]
  fill_in "user[password]", :with => @arr[:password]
  fill_in "user[email]", :with => @arr[:email]
  click_button "Save User"
end

def comment_user
  visit "/users/#{user.id}"
  fill_in "comment[commenter]", :with => @arr[:title]
  fill_in "comment[body]", :with => @arr[:content]
  click_button "Create Comment"
end  

def delete_user # get by Email -> If not exist --> DELETE 
  @user ||= User.where(:email => @arr[:email]).first
  @user.destroy unless @user.nil?
end

def blog_show 
  visit "/blogs"
end

def blog_create
  visit "/blogs/new"
  fill_in "blog[title]", :with => @arrblog[:title]
  fill_in "blog[content]", :with => @arrblog[:content]
  click_button "Save Blog"
end

Given(/^I exist as a user$/) do
#pending # express the regexp above with the code you wish you had
  create_user
end

Given(/^I am not logged in$/) do
  #pending # express the regexp above with the code you wish you had
  visit "/users/logout"
end

When(/^I sign in with valid credentials$/) do
  #pending # express the regexp above with the code you wish you had
  create_user
  login_user
end

Then(/^I see a successful sign in message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content "Listing user"
end

When(/^I return to the site$/) do
  #pending # express the regexp above with the code you wish you had
  visit "/users"
end

Then(/^I should be signed in$/) do
  #pending # express the regexp above with the code you wish you had
  page.should_not have_content("Sign In")
  page.should have_content("Listing user")
end

When(/^I sign in with a wrong username$/) do
  #pending # express the regexp above with the code you wish you had
  @arr = @arr.merge(:name => "username")
  login_user
end

Then(/^I see an invalid login message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Sign In")
end

Then(/^I should be signed out$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Sign In")
  page.should_not have_content("Listing user")
end

When(/^I sign in with a wrong password$/) do
  #pending # express the regexp above with the code you wish you had
  @arr = @arr.merge(:password => "password")
  login_user
end

When(/^I register with valid credentials$/) do
  #pending # express the regexp above with the code you wish you had
  create_visitor
  register_user
end

Then(/^I see a successful register message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Comments")
end

Then(/^I should be register$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Comments")
  page.should_not have_content("Save User")
end

When(/^I register with a wrong username$/) do
  #pending # express the regexp above with the code you wish you had
  @arr = @arr.merge(:name => "")
  register_user
end

Then(/^I see an invalid register message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Create User")
end

When(/^I register with a wrong password$/) do
  #pending # express the regexp above with the code you wish yu had
  @arr = @arr.merge(:password => "")
  register_user
end

When(/^I comment with valid credentials$/) do
  #pending # express the regexp above with the code you wish you had
  create_user
  create_arr_comment
  comment_user
end

Then(/^I see a successful comment$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Title 01")
end

When(/^I comment with a wrong title$/) do
  #pending # express the regexp above with the code you wish you had
  create_user
  create_arr_comment
  @arrcomment = @arrcomment.merge(:title => "")
  comment_user
end

Then(/^I see an invalid comment message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should_not have_content("Title 01")
end

When(/^I comment with a wrong content$/) do
  #pending # express the regexp above with the code you wish you had
  create_user
  create_arr_comment
  @arrcomment = @arrcomment.merge(:content => "")
  comment_user
end

When(/^I see to the blog$/) do
  #pending # express the regexp above with the code you wish you had
  blog_show
end

Then(/^I see an invalid blog message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("New")
end

When(/^I create with valid credentials$/) do
  #pending # express the regexp above with the code you wish you had
  click_link("New")
  create_blog
  blog_create
end

Then(/^I see a successful create message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should have_content("Title 01")
end

When(/^I create with a wrong title$/) do
  #pending # express the regexp above with the code you wish you had
  create_blog
  @arrblog = @arrblog.merge(:title => "")
  blog_create
end

Then(/^I see an invalid create blog message$/) do
  #pending # express the regexp above with the code you wish you had
  page.should_not have_content("Title 01")
end

When(/^I create with a wrong content$/) do
  #pending # express the regexp above with the code you wish you had
  create_blog
  @arrblog = @arrblog.merge(:content => "")
  blog_create
end