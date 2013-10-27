class TimeSource < AllAboard::Source
  configurable :timezone, description: "The zone to display"

  perspective(
    :current_time,
    name: "Current Time",
    description: "The current time.",
    configurable:  {
      format: { description: "The ActiveSupport TimeFormat" }
    },
    jobs: [ TimeSource::UpdateTimeJob ]
  )
end
