require 'spec_helper'

class SerializationSpecSource < AllAboard::Source
  configurable :key
end

describe AllAboard::Source do
  describe ".as_json" do
    let(:hash) { SerializationSpecSource.as_json }
    subject { hash }

    its([:id]) { should eq("serialization_spec") }
    its([:name]) { should eq("SerializationSpec") }
    its([:configurableAttributes]) { should eq([ "serialization_spec.key" ]) }
  end
end
