# frozen_string_literal: true

module FullRequestLogger
  module Job
    extend ActiveSupport::Concern

    included do
      alias_method :request_id, :job_id

      after_perform { |job| FullRequestLogger::Processor.new(job).process }
    end
  end
end
