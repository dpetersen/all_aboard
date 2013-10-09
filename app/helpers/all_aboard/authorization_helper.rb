module AllAboard::AuthorizationHelper
  def implementing_app_login_path
    raise "You need to define this in your application."
  end

  def can_manage_boards?
    raise "You need to define this in your application."
  end
end
