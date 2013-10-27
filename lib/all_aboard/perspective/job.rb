class AllAboard::Perspective::Job
  def self.inherited(subclass)
    subclass.instance_variable_set(:@queue, :all_aboard_job)
  end

  HOURLY = :hourly
  DAILY = :daily
  EVERY_10_MINUTELY = :every_10_minutely

  def self.frequency(schedule = nil)
    if schedule
      @frequency = schedule
    else
      @frequency
    end
  end
end
