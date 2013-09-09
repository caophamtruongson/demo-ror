class UsersController < ApplicationController
  require 'bcrypt'

  def index
    if checkLogin
      @users = User.all
    else
      redirect_to :action => 'login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:name, :password, :email))
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit(:name, :email))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def login
    if params[:user] != nil
      @user = User.find_by_name(params[:user][:username])
      if !@user.nil?
        if @user.password == params[:user][:password]
          session[:auth] = @user
          cookies[:user_id] = @user.id
          if !params[:user][:remember].nil?
            cookies[:username] = params[:user][:username]
            cookies[:password] = params[:user][:password]
            cookies[:remember] = 1
          else
            cookies.delete(:username)
            cookies.delete(:password)
            cookies.delete(:remember)
          end
          redirect_to :action => 'index'
        else
          redirect_to :action => 'index'
        end
      end
    end
  end

# def login
# if session[:auth].nil?
# if params[:user] != nil
# auth = User.authenticate(params[:user][:username],params[:user][:password])
# if !auth.nil?
# session[:auth] = auth[0]
# puts "login "
# puts session[:auth]
# if !params[:user][:remember].nil?
# cookies[:username] = params[:user][:username]
# cookies[:password] = params[:user][:password]
# cookies[:remember] = 1
# end
# redirect_to :action => 'index'
# else
# puts "Auth is nil"
# end
# end
# else
# redirect_to :action => 'index'
# end
# end # end of login method

end
