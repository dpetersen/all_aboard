class AllAboard::ConfigurableAttributesHelper
  def initialize(attributes)
    @attributes = attributes
    build_from_attributes
  end

protected

  def build_from_attributes
    @attributes.each do |attribute|
      id = attribute.id.split(":").last
      define_singleton_method id, -> { attribute.value }
    end
  end
end
