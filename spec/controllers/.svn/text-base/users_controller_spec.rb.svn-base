require 'spec_helper'
require 'capybara/rspec'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
  #sign_in @user
  end

  describe "GET 'login'" do
    it "should be successful" do
      get :login
      expect(response).to be_success
      expect(response.status).to eq(200)
    # check link login
    end

    it "renders the login template" do
      get :login
      expect(response).to render_template("login")
      # check  form login -> ok ?
    end
  end

  describe "POST 'login'" do
    it "should be successful" do
      post :login, :username => @user.name, :password => @user.password # post login
      expect(response).to be_success  # ok ?
      expect(response.status).to eq(200)  # status == 200 ?
    end
  end

  

end