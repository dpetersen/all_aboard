require 'spec_helper'

class SerializationSpecSource < AllAboard::Source
end

describe AllAboard::Source do
  describe ".as_json" do
    subject { SerializationSpecSource.as_json }

    its([:id]) { should eq("serialization_spec") }
    its([:name]) { should eq("SerializationSpec") }
  end
end
