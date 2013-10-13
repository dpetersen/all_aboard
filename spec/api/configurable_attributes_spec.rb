require 'spec_helper'

describe "/api/configurable_attributes/:id.json" do
  let(:response) do
    put(
      all_aboard.api_configurable_attribute_path("source:key", format: :json),
      configurable_attribute: { value: "Value" }
    )
  end

  context "when no ConfigurableAttributeValue exists" do
    it "creates one" do
      expect(response.status). to eq(204)
      expect(AllAboard::ConfigurableAttributeValue.count).to eq(1)
      value = AllAboard::ConfigurableAttributeValue.first
      expect(value.configurable_attribute_id).to eq("source:key")
      expect(value.value).to eq("Value")
    end
  end

  context "when a ConfigurableAttributeValue already exists" do
    before do
      AllAboard::ConfigurableAttributeValue.create!(
        configurable_attribute_id: "source:key",
        value: "Old Value"
      )
    end

    it "updates the existing record" do
      expect(response.status). to eq(204)
      expect(AllAboard::ConfigurableAttributeValue.count).to eq(1)
      value = AllAboard::ConfigurableAttributeValue.first
      expect(value.configurable_attribute_id).to eq("source:key")
      expect(value.value).to eq("Value")
    end
  end
end