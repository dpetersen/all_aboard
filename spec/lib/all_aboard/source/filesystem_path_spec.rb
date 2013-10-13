require 'spec_helper'

describe AllAboard::Source do
  describe "#filesystem_path" do
    # The SourceManager is the one that sets it, so they must be loaded.
    before { AllAboard::SourceManager.instance.sources }
    subject { TimeSource.filesystem_path }

    its(:to_s) { should end_with("app/sources/time_source") }
  end
end
