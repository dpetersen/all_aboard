require 'spec_helper'

describe AllAboard::SourceManager do
  describe ".instance" do
    it "returns the same instance every time" do
      expect(AllAboard::SourceManager.instance).to eql(AllAboard::SourceManager.instance)
    end
  end

  # Listen, this is awful, at least as far as how I can't control the data for
  # the system under test.  I had a nice implementation of this, but in
  # development mode it would lose its references to the sources when certain
  # files unloaded and reloaded.  My singleton didn't live very long, but only
  # in development.  I decided this one class getting ugly was better than an
  # awful development experience.
  #
  # This is covered under integration tests, so I'm not a completely horrible
  # person.  The feature where it doesn't fail under class reloading isn't
  # tested because I have no idea what awful hoops I'd have to jump through
  # there.
  describe "#sources" do
    subject { AllAboard::SourceManager.instance.sources }
    it { should include(TimeSource) }
  end
end
