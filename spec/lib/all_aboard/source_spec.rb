require 'spec_helper'

class SourceSpecSource < AllAboard::Source
  configurable :first, :second
end

describe AllAboard::Source do
  describe ".configuration" do
    subject { SourceSpecSource.configuration }

    context "when the attributes haven't been configured" do
      it { should eq(first: nil, second: nil) }
    end

    context "when the attributes have been configured" do
      it "pulls those out of the db or whatever"
    end
  end
end
