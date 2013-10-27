require 'spec_helper'

describe AllAboard::PerspectiveAssignmentSerializer do
  let(:assignment) do
    FactoryGirl.create(
      :perspective_assignment,
      template_id: "time:current_time:2x1",
      column: 1,
      row: 2
    )
  end
  let(:serializer) { AllAboard::PerspectiveAssignmentSerializer.new(assignment) }
  subject { serializer.as_json[:perspective_assignment] }

  its([:id]) { should eq(assignment.id) }
  its([:template]) { should eq("time:current_time:2x1") }
  its([:column]) { should eq(1) }
  its([:row]) { should eq(2) }
  its([:payload]) { should eq(assignment.data_key) }
end
