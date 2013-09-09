class BlogsController < ApplicationController
  def index
    if checkLogin
      @blogs = Blog.all
    else
      redirect_to users_login_path
    end
  end
  def new
    @user = User.find(cookies[:user_id])
    @blog = Blog.new
  end
  def create
    @user = User.find(cookies[:user_id])
    @blog = @user.blogs.new(params[:blog].permit(:title, :content))
    if @blog.save
      redirect_to blogs_path
    else
      redirect_to new_blog_path
    end
  end
  def show
    @blog = Blog.find(params[:id])
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(params[:blog].permit(:title, :content))
      redirect_to blogs_path
    else
      redirect_to edit_blog_path
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end
end
