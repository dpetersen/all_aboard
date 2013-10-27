require 'spec_helper'

class JobSpecJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::HOURLY
end

describe AllAboard::Perspective::Job do
  describe ".frenquency" do
    subject { JobSpecJob.frequency }
    it { should eq(AllAboard::Perspective::Job::HOURLY) }
  end
end
