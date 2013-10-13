module AllAboard
  class ConfigurableAttributeValue < ActiveRecord::Base
    validates :configurable_attribute_id, :value, presence: true
  end
end
