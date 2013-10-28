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

  def self.perform(perspective_assignment_id)
    assignment = AllAboard::PerspectiveAssignment.find(perspective_assignment_id)
    job = new(assignment)
    job.perform
    assignment.update_data(job.data)
  end

  def initialize(perspective_assignment)
    @perspective_assignment = perspective_assignment
  end

  def data(hash = nil)
    if hash.present?
      @data = hash
    else
      @data
    end
  end
end