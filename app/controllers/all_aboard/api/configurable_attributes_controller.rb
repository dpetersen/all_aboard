require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class ConfigurableAttributesController < AllAboard::Api::ApiController
    respond_to :json

    # This is somewhat ugly.  There are cases (new assignment, deep linking to
    # assignment configuration) where it will try and fetch the list directly.
    # Because some attributes might be available but not yet configured, we
    # can't only fetch the IDs it requests.  Some aren't in the database.
    def index
      id = params[:ids].first.split(":").third
      assignment = AllAboard::PerspectiveAssignment.find(id)
      respond_with assignment.configurable_attributes
    end

    def update
      attribute_value = AllAboard::ConfigurableAttributeValue.
        where(configurable_attribute_id: params[:id]).first_or_initialize

      attribute_value.update_attributes!(
        value: params[:configurable_attribute][:value]
      )

      elements = elements = params[:id].split(":")
      case elements.length
      when 4
        assignment_id = elements.third
        assignment = AllAboard::PerspectiveAssignment.find(assignment_id)
        assignment.queue_for_all_frequencies
      when 2
        source_id = params[:id].split(":").first
        AllAboard::PerspectiveAssignment.
          where("template_id LIKE '#{source_id}:%'").
          each(&:queue_for_all_frequencies)
      end

      respond_with attribute_value
    end
  end
end
