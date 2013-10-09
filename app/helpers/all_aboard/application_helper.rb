module AllAboard
  module ApplicationHelper
    def body_data
      {
        "can-manage-boards" => can_manage_boards?,
        "implementing_app_login_path" => implementing_app_login_path
      }
    end
  end
end
