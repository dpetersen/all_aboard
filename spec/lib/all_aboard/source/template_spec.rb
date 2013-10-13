require 'spec_helper'

describe AllAboard::Source::Template do
  subject { AllAboard::Source::Template.new("time:current_time", 1, 2) }

  its(:id) { should eq("time:current_time:1x2") }
  its(:width) { should eq(1) }
  its(:height) { should eq(2) }
end
