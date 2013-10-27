
require 'spec_helper'

module AllAboard
  describe PerspectiveAssignment do
    describe ".queue_for_frequency" do
      let!(:assignment1) { FactoryGirl.create(:perspective_assignment) }
      let!(:assignment2) { FactoryGirl.create(:perspective_assignment) }

      before do
        AllAboard::PerspectiveAssignment.queue_for_frequency(
          AllAboard::Perspective::Job::EVERY_10_MINUTELY
        )
      end

      it "queues the expected jobs" do
        expect(TimeSource::UpdateTimeJob).to have_queued.in(
          :all_aboard_job, assignment1.id
        )
        expect(TimeSource::UpdateTimeJob).to have_queued.in(
          :all_aboard_job, assignment2.id
        )
      end
    end

    describe "#queue_for_frequency" do
      let(:assignment) { FactoryGirl.create(:perspective_assignment) }

      before do
        assignment.queue_for_frequency(
          AllAboard::Perspective::Job::EVERY_10_MINUTELY
        )
      end

      it "queues the expected jobs" do
        expect(TimeSource::UpdateTimeJob).to have_queued.in(
          :all_aboard_job, assignment.id
        )
      end
    end
  end
end
