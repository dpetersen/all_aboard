require 'spec_helper'

class JobSpecJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::HOURLY

  def perform
    data(key: "data about #{@perspective_assignment.id}!")
  end
end

describe AllAboard::Perspective::Job do
  describe ".frenquency" do
    subject { JobSpecJob.frequency }
    it { should eq(AllAboard::Perspective::Job::HOURLY) }
  end

  describe ".perform" do
    let(:assignment) { FactoryGirl.build(:perspective_assignment) }
    let(:job) { double(perform: nil, data: { key: "value" }) }
    before do
      AllAboard::PerspectiveAssignment.stub(find: assignment)
      assignment.stub(update_data: nil)
      JobSpecJob.stub(new: job)
      JobSpecJob.perform(19)
    end

    it "finds the PerspectiveAssignment by the passed-in ID" do
      AllAboard::PerspectiveAssignment.should have_received(:find).with(19)
    end

    it "instantiates itself with the correct PerspectiveAssignment" do
      JobSpecJob.should have_received(:new).with(assignment)
    end

    it "calls run on the instantiated job" do
      job.should have_received(:perform)
    end

    it "passes the data along to PerspectiveAssignment for saving" do
      assignment.should have_received(:update_data).with(key: "value")
    end
  end

  describe "#data" do
    let(:assignment) { FactoryGirl.create(:perspective_assignment) }
    let(:job) { JobSpecJob.new(assignment) }
    before { job.perform }
    subject { job.data }

    its([:key]) { should eq("data about #{assignment.id}!") }
  end
end
