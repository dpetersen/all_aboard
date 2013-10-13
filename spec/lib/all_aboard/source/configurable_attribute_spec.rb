require 'spec_helper'

describe AllAboard::Source::ConfigurableAttribute do
  describe "basic attributes" do
    subject { AllAboard::Source::ConfigurableAttribute.new("parent", :key) }
    its(:id) { should eq("parent:key") }
    its(:key) { should eq(:key) }
  end

  describe "#name" do
    subject { attribute.name }

    context "when not provided" do
      let(:attribute) do
        AllAboard::Source::ConfigurableAttribute.new("parent", :key)
      end
      it { should eq("Key") }
    end

    context "when provided" do
      let(:attribute) do
        AllAboard::Source::ConfigurableAttribute.new("parent", :key, "Overridden")
      end
      it { should eq("Overridden") }
    end
  end

  describe "#description" do
    subject { attribute.description }

    context "when not provided" do
      let(:attribute) do
        AllAboard::Source::ConfigurableAttribute.new("parent", :key)
      end
      it { should be_nil }
    end

    context "when provided" do
      let(:attribute) do
        AllAboard::Source::ConfigurableAttribute.new("parent", :key, nil, "Description")
      end
      it { should eq("Description") }
    end
  end

  describe "#value" do
    let(:attribute) do
      AllAboard::Source::ConfigurableAttribute.new("parent", :key)
    end
    subject { attribute.value }

    context "by default" do
      it { should be_nil }
    end

    context "after it has been set" do
      before { attribute.value = "value" }
      it { should eq("value") }
    end
  end

  describe "#as_json" do
    let(:attribute) do
      AllAboard::Source::ConfigurableAttribute.new("parent", :key, "Name", "Description")
    end
    before { attribute.value = "value" }
    subject { attribute.as_json }

    its([:id]) { should eq("parent:key") }
    its([:key]) { should eq(:key) }
    its([:name]) { should eq("Name") }
    its([:description]) { should eq("Description") }
    its([:value]) { should eq("value") }
  end
end
