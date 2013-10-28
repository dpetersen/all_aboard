class TimeSource::UpdateTimeJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::EVERY_10_MINUTELY

  def perform
    zone_name = @perspective_assignment.source.configurable_attributes.first.value
    format_name = @perspective_assignment.configurable_attributes.first.value
    time = Time.now.in_time_zone(zone_name)

    data(
      time: time.to_s(format_name.to_sym),
      zone: zone_name,
      format: format_name
    )
  end
end
