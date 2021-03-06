require 'spec_helper'

describe AllAboard::PerspectiveAssignment do
  let(:r) { AllAboard.redis }
  let(:assignment) { FactoryGirl.create(:perspective_assignment) }

  describe "#update_data" do
    before { assignment.update_data(key: "value") }

    it "saves as serialized JSON by the PerspectiveAssignment's ID" do
      expect(r.keys.length).to eq(1)
      key = "data:#{assignment.id}"
      expect(r.keys).to include(key)
      expect(JSON.parse(r.get(key))).to eq("key" => "value")
    end
  end

  describe "#current_data" do
    subject { assignment.current_data }

    context "when the data has been set" do
      let(:data) { { key: "value" }.to_json }
      before { AllAboard.redis.set("data:#{assignment.id}", data) }

      it { should eq("key" => "value") }
    end

    context "when no data has been set" do
      it { should be_empty }
    end
  end
end
