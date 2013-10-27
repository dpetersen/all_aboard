class TimeSource < AllAboard::Source
  configurable :timezone, description: "The zone to display"

  job TimeSource::UpdateTimeJob

  perspective(
    :current_time,
    name: "Current Time",
    description: "The current time.",
    configurable:  {
      format: { description: "The ActiveSupport TimeFormat" }
    }
  )
end
