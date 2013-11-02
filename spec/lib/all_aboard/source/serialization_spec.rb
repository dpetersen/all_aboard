require 'spec_helper'

describe AllAboard::Source do
  before { AllAboard::SourceManager.instance.sources }

  describe ".as_json" do
    subject { TimeSource.as_json }

    its([:id]) { should eq("time") }
    its([:name]) { should eq("Time") }
    its([:configurable_attribute_ids]) { should eq([ "time:timezone" ]) }
    its([:perspective_ids]) { should eq([ "time:current_time" ]) }
  end
end
