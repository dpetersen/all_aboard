require 'spec_helper'

module AllAboard
  describe ConfigurableAttributeValue do
    it { should validate_presence_of(:configurable_attribute_id) }
    it { should validate_presence_of(:value) }
  end
end
