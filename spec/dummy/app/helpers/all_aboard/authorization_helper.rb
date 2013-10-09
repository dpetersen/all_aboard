module AllAboard::AuthorizationHelper
  def implementing_app_login_path
    Rails.application.routes.url_helpers.login_path
  end

  def can_manage_boards?
    !!session[:logged_in]
  end
end
