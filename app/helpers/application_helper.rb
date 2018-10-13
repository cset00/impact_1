module ApplicationHelper
  def admin_user
    AdminUser.find_by(id: session[:admin_user_id])
  end

  def logged_in?

    !!admin_user #user object or nil
  end
end
