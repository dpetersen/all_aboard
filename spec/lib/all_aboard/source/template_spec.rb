require 'spec_helper'

describe AllAboard::Source::Template do
  let(:template) do
    AllAboard::Source::Template.new("time:current_time", 1, 2, "markup")
  end
  subject { template }

  its(:id) { should eq("time:current_time:1x2") }
  its(:width) { should eq(1) }
  its(:height) { should eq(2) }
  its(:markup) { should eq("markup") }

  describe "#as_json" do
    subject { template.as_json }

    its([:id]) { "time:current_time:1x2" }
    its([:width]) { 1 }
    its([:height]) { 2 }
    its([:markup]) { "markup" }
  end
end
