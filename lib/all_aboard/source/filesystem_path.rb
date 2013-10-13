module AllAboard::Source::FilesystemPath
  extend ActiveSupport::Concern

  module ClassMethods
    def filesystem_path(path = nil)
      if path.present?
        @filesystem_path = path
      else
        @filesystem_path
      end
    end
  end
end
