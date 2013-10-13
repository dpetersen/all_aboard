require 'spec_helper'

describe AllAboard::Source do
  before { AllAboard::SourceManager.instance.sources }

  describe ".as_json" do
    subject { TimeSource.as_json }

    its([:id]) { should eq("time") }
    its([:name]) { should eq("Time") }
    its([:configurableAttributes]) { should eq([ "time:timezone" ]) }
    its([:perspectives]) { should eq([ "time:current_time" ]) }
  end
end
