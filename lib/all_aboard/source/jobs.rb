module AllAboard::Source::Jobs
  extend ActiveSupport::Concern

  module ClassMethods
    def job(klass)
      @jobs ||= []
      @jobs << klass
    end

    def jobs_for_frequency(frequency)
      return [] if @jobs.nil?
      @jobs.select { |job| job.frequency == frequency }
    end
  end
end
