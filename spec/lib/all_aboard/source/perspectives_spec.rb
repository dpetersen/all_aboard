require 'spec_helper'

describe AllAboard::Source do
  before { AllAboard::SourceManager.instance.sources }

  describe ".perspectives" do
    subject { TimeSource.perspectives }

    its(:length) { should eq(1) }
    its("first.filename") { should eq(:current_time) }
  end
end
