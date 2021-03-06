module AllAboard::PerspectiveAssignment::JobExecution
  extend ActiveSupport::Concern

  module ClassMethods
    def queue_for_frequency(frequency)
      all.each { |a| a.queue_for_frequency(frequency) }
    end
  end

  def queue_for_all_frequencies
    AllAboard::Perspective::Job::FREQUENCIES.each do |frequency|
      queue_for_frequency(frequency)
    end
  end

  def queue_for_frequency(frequency)
    perspective.jobs_for_frequency(frequency).each do |job|
      Resque.enqueue(job, self.id)
    end
  end
end
