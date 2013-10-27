class TimeSource::UpdateTimeJob < AllAboard::Perspective::Job
  frequency AllAboard::Perspective::Job::EVERY_10_MINUTELY
end
