class TimeSource::UpdateTimeJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::EVERY_10_MINUTELY

  def perform
    # TODO: Should really be handled by defaults in the attribute definition
    zone_name = @perspective_assignment.source.configurable_attributes.first.value
    zone_name ||= "America/Los_Angeles"

    format_name = @perspective_assignment.configurable_attributes.first.value
    format_name ||= "short"

    time = Time.now.in_time_zone(zone_name)

    data(
      time: time.to_s(format_name.to_sym),
      zone: zone_name,
      format: format_name
    )
  end
end
