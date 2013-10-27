require 'spec_helper'

describe AllAboard::PerspectiveAssignment do
  it { should belong_to(:slide) }

  it { should validate_presence_of(:slide) }
  it { should validate_presence_of(:template_id) }
  it { should validate_presence_of(:column) }
  it { should validate_presence_of(:row) }

  describe "#template=" do
    subject(:assignment) { AllAboard::PerspectiveAssignment.new }
    before { assignment.template = "test" }

    its(:template_id) { should eq("test") }
  end
end
