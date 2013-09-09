class UserMailer < ActionMailer::Base
  default from: "vu.son@mulodo.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000" + users_login_path
    attachments['robots.txt'] = File.read("#{Rails.root}/public/robots.txt")  
    mail(to: @user.email, subject: 'Welcome to Ruby on Rails')
    # mail(to: [@user.email, "jetvhs@gmail.com"], subject: 'Welcome to Ruby on Rails')
    # subject: 'Welcome to Ruby on Rails'
    # recipients ["jetvhs@gmail.com", "vu.son@mulodo.com", @user.email]
    # from "vu.son@mulodo.com"
    # body "Hello world"
  end
end
