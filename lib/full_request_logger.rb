# frozen_string_literal: true

require 'full_request_logger/version'
require 'full_request_logger/engine'

module FullRequestLogger
  extend ActiveSupport::Autoload

  autoload :Recorder
  autoload :Processor

  mattr_accessor :ttl
  mattr_accessor :enabled
  mattr_accessor :eligibility
  mattr_accessor :credentials
  mattr_accessor :data_adapter
  mattr_accessor :storage_class
end
