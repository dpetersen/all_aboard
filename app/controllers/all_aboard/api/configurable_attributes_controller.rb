require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class ConfigurableAttributesController< AllAboard::Api::ApiController
    respond_to :json

    def update
      attribute_value = AllAboard::ConfigurableAttributeValue.
        first_or_initialize(configurable_attribute_id: params[:id])

      attribute_value.update_attributes!(
        value: params[:configurable_attribute][:value]
      )

      respond_with attribute_value
    end
  end
end
