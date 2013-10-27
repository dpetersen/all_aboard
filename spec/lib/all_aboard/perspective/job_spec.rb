require 'spec_helper'

class JobSpecJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::HOURLY
end

describe AllAboard::Perspective::Job do
  describe ".frenquency" do
    subject { JobSpecJob.frequency }
    it { should eq(AllAboard::Perspective::Job::HOURLY) }
  end

  describe ".perform" do
    let(:assignment) { FactoryGirl.create(:perspective_assignment) }
    let(:job) { double(perform: nil) }
    before do
      JobSpecJob.stub(new: job)
      JobSpecJob.perform(assignment.id)
    end

    it "instantiates itself with the correct PerspectiveAssignment" do
      JobSpecJob.should have_received(:new).with(assignment)
    end

    it "calls run on the instantiated job" do
      job.should have_received(:perform)
    end
  end
end
