require 'spec_helper'

class JobSpecJob < AllAboard::Source::Job
  frequency AllAboard::Source::Job::HOURLY
end

describe AllAboard::Source::Job do
  describe ".frenquency" do
    subject { JobSpecJob.frequency }
    it { should eq(AllAboard::Source::Job::HOURLY) }
  end
end
