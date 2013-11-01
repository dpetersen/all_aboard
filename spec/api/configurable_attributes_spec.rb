require 'spec_helper'

describe "GET /api/configurable_attributes.json" do
  let(:assignment) { FactoryGirl.create(:perspective_assignment) }
  let(:id) { "time:current_time:#{assignment.id}:format" }
  let(:response) do
    get(
      all_aboard.api_configurable_attributes_path(format: :json),
      ids: [ id ]
    )
  end
  subject(:hash) { JSON.parse(response.body)["configurable_attributes"] }
  before do
    AllAboard::ConfigurableAttributeValue.create!(
      configurable_attribute_id: id,
      value: "value"
    )
  end

  it "returns the expected configurable attributes" do
    expect(hash.length).to eq(1)
    expect(hash.first["id"]).to eq(id)
    expect(hash.first["value"]).to eq("value")
  end
end

describe "PUT /api/configurable_attributes/:id.json" do
  let(:response) do
    put(
      all_aboard.api_configurable_attribute_path("time:timezone", format: :json),
      configurable_attribute: { value: "PST" }
    )
  end

  context "when no ConfigurableAttributeValue exists" do
    it "creates one" do
      expect(response.status). to eq(204)
      expect(AllAboard::ConfigurableAttributeValue.count).to eq(1)
      value = AllAboard::ConfigurableAttributeValue.first
      expect(value.configurable_attribute_id).to eq("time:timezone")
      expect(value.value).to eq("PST")
    end

    context "when a source attribute" do
      let!(:assignment) { FactoryGirl.create(:perspective_assignment) }

      it "queues jobs associated with the source" do
        response
        expect(TimeSource::UpdateTimeJob).to have_queued(assignment.id)
      end
    end

    context "when an assignment attribute" do
      let(:assignment) { FactoryGirl.create(:perspective_assignment) }
      let(:id) { "time:current_time:#{assignment.id}:format" }
      let(:response) do
        put(
          all_aboard.api_configurable_attribute_path(id, format: :json),
          configurable_attribute: { value: "short" }
        )
      end

      it "queues jobs associated with the perspective" do
        response
        expect(TimeSource::UpdateTimeJob).to have_queued(assignment.id)
      end
    end
  end

  context "when a ConfigurableAttributeValue already exists" do
    before do
      AllAboard::ConfigurableAttributeValue.create!(
        configurable_attribute_id: "time:timezone",
        value: "MST"
      )
    end

    it "updates the existing record" do
      expect(response.status). to eq(204)
      expect(AllAboard::ConfigurableAttributeValue.count).to eq(1)
      value = AllAboard::ConfigurableAttributeValue.first
      expect(value.configurable_attribute_id).to eq("time:timezone")
      expect(value.value).to eq("PST")
    end
  end
end
