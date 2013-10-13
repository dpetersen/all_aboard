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

  describe "#sizes" do
    subject { perspective.sizes }
    let(:perspective) { AllAboard::Source::Perspective.new("source", :filename) }

    context "with no sizes" do
      it { should be_empty }
    end

    context "after #add_size is called" do
      before { perspective.add_size(2, 2) }
      it { should eq([ [ 2, 2 ] ]) }
    end
  end
end
