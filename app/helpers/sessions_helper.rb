module SessionsHelper
  def log_in(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  def current_user
    if session[:admin_user_id]
      @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end
end
