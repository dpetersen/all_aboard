require 'spec_helper'

describe AllAboard::Source do
  before { AllAboard::SourceManager.instance.sources }

  describe ".has_assets?" do
    subject { TimeSource.has_assets? }
    it { should be_true }
  end

  describe ".assets_paths" do
    subject { TimeSource.assets_path }
    it { should end_with("app/sources/time_source/assets") }
  end

  describe ".has_stylesheets?" do
    subject { TimeSource.has_stylesheets? }
    it { should be_true }
  end

  describe ".stylesheet_paths" do
    subject { TimeSource.stylesheet_paths }
    its(:length) { should eq(1) }
    its(:first) { should eq("stylesheets/time_source.css.scss") }
  end
end
