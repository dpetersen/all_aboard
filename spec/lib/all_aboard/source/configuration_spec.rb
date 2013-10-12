require 'spec_helper'

class ConfigurationSpecSource < AllAboard::Source
  configurable :first
  configurable :second, name: "Named"
  configurable :third, description: "Description"
end

describe AllAboard::Source do
  describe ".configurable_attributes" do
    let(:configurable_attributes) { ConfigurationSpecSource.configurable_attributes }
    subject { configurable_attributes }

    context "when the attributes haven't been configured" do
      its(:length) { should eq(3) }

      describe "a basic ConfigurableAttribute" do
        subject { configurable_attributes.first }
        its(:id) { should eq("configuration_spec.first") }
        its(:key) { should eq(:first) }
        its(:name) { should eq("First") }
        its(:value) { should be_nil }
      end

      describe "a ConfigurableAttribute with a name" do
        subject { configurable_attributes.second }
        its(:id) { should eq("configuration_spec.second") }
        its(:key) { should eq(:second) }
        its(:name) { should eq("Named") }
        its(:value) { should be_nil }
      end

      describe "a ConfigurableAttribute with a description" do
        subject { configurable_attributes.third }
        its(:id) { should eq("configuration_spec.third") }
        its(:key) { should eq(:third) }
        its(:description) { should eq("Description") }
        its(:value) { should be_nil }
      end
    end

    context "when the attributes have been configured" do
      it "pulls those out of the db or whatever"
    end
  end
end
