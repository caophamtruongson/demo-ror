# CREATE

Given(/^I want contructor user username with "(.*?)", password with "(.*?)", email with "(.*?)"$/) do |arg1, arg2, arg3|
#pending # express the regexp above with the code you wish you had
  @user = User.new(name:arg1, hashed_password:arg2, email:arg3)
  @count1 = User.count
end

When(/^I call create User$/) do
#pending # express the regexp above with the code you wish you had
  @user.save
  @count2 = User.count
end

Then(/^I should see user have databaes$/) do
#pending # express the regexp above with the code you wish you had
  @count2.should == @count1+1
end

# UPDATE

Given(/^I find user username with "(.*?)"$/) do |arg1|
  @user = User.find_by_name(arg1)
  assert_not_nil(@user,"user found")
end

When(/^I will update username with "(.*?)"$/) do |arg1|
  @user.name = arg1
  @user.save
end

Then(/^I should see user have username with "(.*?)"$/) do |arg1|
  @user = User.find_by_name(arg1)
  assert_not_nil(@user,"user found")
end

# DELETE

Given(/^I find user username delete with "(.*?)"$/) do |arg1|
  @user = User.find_by_name(arg1)
  assert_not_nil(@user,"user found")
  @count1 = User.count
end

When(/^I will delete username "(.*?)"$/) do |arg1|
#  pending # express the regexp above with the code you wish you had
  @user.destroy
  @count2 = User.count
end

Then(/^I should see not user database$/) do
#pending # express the regexp above with the code you wish you had
  @count2.should == @count1-1
end

# TRANSACTION

Given(/^contructor user$/) do |table|
  @user=User.new
  table.hashes.each do |t|
    @user=User.new(name:t[:name], password:t[:password], email:t[:email])
  end
end

When(/^I will create user$/) do
  @user.save
end

Then(/^I should not see user$/) do
  
end