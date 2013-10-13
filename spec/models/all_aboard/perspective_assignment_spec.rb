require 'spec_helper'

module AllAboard
  describe PerspectiveAssignment do
    it { should belong_to(:slide) }

    it { should validate_presence_of(:slide) }
    it { should validate_presence_of(:template_id) }
    it { should validate_presence_of(:column) }
    it { should validate_presence_of(:row) }
  end
end
