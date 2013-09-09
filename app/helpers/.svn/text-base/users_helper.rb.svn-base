module UsersHelper
  def checkLogin
    if !session[:auth].nil?
    return true
    else
    return false
    end
  end

  def logout
    cookies.delete(:user_id)
    reset_session
    redirect_to :action => 'login'
  end
end
