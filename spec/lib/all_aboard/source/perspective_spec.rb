require 'spec_helper'

class PerspectiveSpecJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::HOURLY
end

class PerspectiveSpecJobTwo < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::EVERY_10_MINUTELY
end

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

  describe "#configurable" do
    subject { perspective.configurable }
    let(:perspective) do
      AllAboard::Source::Perspective.new("source", :filename, nil, nil, { test: { key: :value } })
    end
    it { should eq({ test: { key: :value } }) }
  end

  describe "#jobs_for_frequency" do
    subject { perspective.jobs_for_frequency(frequency) }
    let(:jobs) { [ PerspectiveSpecJob, PerspectiveSpecJobTwo ] }
    let(:perspective) do
      AllAboard::Source::Perspective.new("source", :filename, nil, nil, nil, jobs)
    end

    context "with a frequency that is scheduled" do
      let(:frequency) { AllAboard::Perspective::Job::HOURLY }
      it { should eq([ PerspectiveSpecJob ]) }
    end

    context "with a frequency that it not scheduled" do
      let(:frequency) { AllAboard::Perspective::Job::DAILY }
      it { should be_empty }
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
    its([:template_ids]) { should eq([ "source:filename:1x2" ]) }
  end

  describe "#reset_templates" do
    let(:perspective) do
      AllAboard::Source::Perspective.new("source", :filename, "Name", "Description")
    end
    before do
      perspective.add_template(1, 2, "markup")
      perspective.reset_templates
    end
    subject { perspective.templates }

    it { should be_empty }
  end
end
