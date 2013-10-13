require 'spec_helper'

describe AllAboard::Source do
  before { AllAboard::SourceManager.instance.sources }

  describe ".perspectives" do
    subject { TimeSource.perspectives }

    its(:length) { should eq(1) }
    its("first.filename") { should eq(:current_time) }
    its("first.sizes") { should eq([ [ 2, 1 ], [ 4, 4 ] ]) }
  end
end
