class TopController < ApplicationController
  def main
    if session[:uid]
      render 'main'
    else
      render 'login'
    end
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass]
        session[:uid] = user.uid
        redirect_to top_main_path
      else
        render 'login'
      end
    else
      render 'login'
    end
  end
  
  def logout
    session.delete(:id)
    redirect_to top_main_path
  end
end
