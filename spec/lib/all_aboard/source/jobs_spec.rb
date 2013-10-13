require 'spec_helper'

class JobsSpecJob < AllAboard::Source::Job
  frequency AllAboard::Source::Job::HOURLY
end

class JobsSpecSource < AllAboard::Source
  job JobsSpecJob
end

describe AllAboard::Source do
  describe "#jobs_for_frequency" do
    subject { JobsSpecSource.jobs_for_frequency(frequency) }

    context "with a frequency that is scheduled" do
      let(:frequency) { AllAboard::Source::Job::HOURLY }
      it { should eq([ JobsSpecJob ]) }
    end

    context "with a frequency that it not scheduled" do
      let(:frequency) { AllAboard::Source::Job::DAILY }
      it { should be_empty }
    end
  end
end
