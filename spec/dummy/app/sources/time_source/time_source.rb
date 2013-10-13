class TimeSource < AllAboard::Source
  configurable :timezone, description: "The zone to display"

  job TimeSource::UpdateTimeJob
end
