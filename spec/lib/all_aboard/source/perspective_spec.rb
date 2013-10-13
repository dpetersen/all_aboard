require 'spec_helper'

describe AllAboard::Source::Perspective do
  describe "#id" do
    subject { AllAboard::Source::Perspective.new("source", :filename).id }
    it { should eq("source:filename") }
  end

  describe "#filename" do
    subject { AllAboard::Source::Perspective.new("source", :filename).filename }
    it { should eq(:filename) }
  end

  describe "#name" do
    subject { perspective.name }

    context "by default" do
      let(:perspective) { AllAboard::Source::Perspective.new("source", :filename) }
      it { should eq("filename") }
    end

    context "overridden" do
      let(:perspective) do
        AllAboard::Source::Perspective.new("source", :filename, "Name")
      end
      it { should eq("Name") }
    end
  end

  describe "#description" do
    subject { perspective.description }

    context "by default" do
      let(:perspective) { AllAboard::Source::Perspective.new("source", :filename) }
      it { should be_nil }
    end

    context "overridden" do
      let(:perspective) do
        AllAboard::Source::Perspective.new("source", :filename, nil, "Description")
      end
      it { should eq("Description") }
    end
  end

  describe "#templates" do
    subject { perspective.templates }
    let(:perspective) { AllAboard::Source::Perspective.new("source", :filename) }

    context "with no templates" do
      it { should be_empty }
    end

    context "after #add_template is called" do
      before { perspective.add_template(2, 2, "markup") }
      its("first.id") { should eq("source:filename:2x2") }
    end
  end

  describe "#as_json" do
    let(:perspective) do
      AllAboard::Source::Perspective.new("source", :filename, "Name", "Description")
    end
    before { perspective.add_template(1, 2, "markup") }
    subject { perspective.as_json }

    its([:id]) { should eq("source:filename") }
    its([:name]) { should eq("Name") }
    its([:description]) { should eq("Description") }
    its([:templates]) { should eq([ "source:filename:1x2" ]) }
  end
end
