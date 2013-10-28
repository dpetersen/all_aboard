require 'spec_helper'

describe AllAboard::ConfigurableAttributesHelper do
  let(:assignment) { FactoryGirl.create(:perspective_assignment) }
  subject do
    AllAboard::ConfigurableAttributesHelper.new(assignment.configurable_attributes)
  end

  its(:format) { should be_nil }
end
