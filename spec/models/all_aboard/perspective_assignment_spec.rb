require 'spec_helper'

module AllAboard
  describe PerspectiveAssignment do
    it { should belong_to(:slide) }

    it { should validate_presence_of(:slide) }
    it { should validate_presence_of(:template_id) }
    it { should validate_presence_of(:column) }
    it { should validate_presence_of(:row) }

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

    describe "#template=" do
      subject(:assignment) { AllAboard::PerspectiveAssignment.new }
      before { assignment.template = "test" }

      its(:template_id) { should eq("test") }
    end

    describe "#source" do
      let(:assignment) do
        AllAboard::PerspectiveAssignment.new(template_id: "time:current_time:2x1")
      end
      subject { assignment.source }

      it { should eq(TimeSource) }
    end

    describe "#source" do
      let(:assignment) do
        AllAboard::PerspectiveAssignment.new(template_id: "time:current_time:2x1")
      end
      subject { assignment.perspective }

      its(:id) { should eq("time:current_time") }
    end
  end

  describe "#configurable_attributes" do
    let(:assignment) do
      FactoryGirl.create(
        :perspective_assignment,
        template_id: "time:current_time:2x1"
      )
    end
    subject(:attributes) { assignment.configurable_attributes }

    its(:length) { should eq(1) }

    describe "the configured attribute" do
      subject(:configured_attribute) { attributes.first }

      its(:id) { should eq("time:current_time:#{assignment.id}:format") }
      its(:name) { should eq("Format") }
      its(:description) { should eq("The ActiveSupport TimeFormat") }

      describe "value" do
        subject { configured_attribute.value }

        context "when no value has been set" do
          it { should be_nil }
        end

        context "when a value has been saved" do
          before do
            AllAboard::ConfigurableAttributeValue.create!(
              configurable_attribute_id: "time:current_time:#{assignment.id}:format",
              value: "value"
            )
          end

          it { should eq("value") }
        end
      end
    end
  end
end
