module AllAboard
  class Source
    include Configuration
    include Serialization
    include FilesystemPath
    include Perspectives
  end
end
