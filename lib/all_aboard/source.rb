module AllAboard
  class Source
    include Configuration
    include Serialization
    include Jobs
    include FilesystemPath
    include Perspectives
  end
end
