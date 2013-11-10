module AllAboard
  class Source
    include Configuration
    include Serialization
    include FilesystemPath
    include Perspectives
    include Assets
  end
end
