class TimeSource::UpdateTimeJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::EVERY_10_MINUTELY

  def perform
    # TODO: Should really be handled by defaults in the attribute definition
    timezone = config.source.timezone || "America/Los_Angeles"
    format = config.assignment.format || "short"

    time = Time.now.in_time_zone(timezone)

    data(
      time: time.to_s(format.to_sym),
      timezone: timezone,
      format: format
    )
  end
end
