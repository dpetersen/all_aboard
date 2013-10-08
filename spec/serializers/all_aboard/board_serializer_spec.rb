require 'spec_helper'

describe AllAboard::BoardSerializer do
  let(:board) { FactoryGirl.create(:board, name: "Test Board Name") }
  subject { AllAboard::BoardSerializer.new(board).as_json[:board] }

  its([:name]) { should eq("Test Board Name") }
end
