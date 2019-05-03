# frozen_string_literal: true

require 'active_record'

require_relative 'explainer/config'
require_relative 'explainer/version'

begin
  require 'rails'
  require_relative 'explainer/railtie'
rescue LoadError
  nil
end

module ActiveRecord
  module Explainer # :nodoc:
    def self.configure
      yield config
    end

    def self.config
      @config ||= Config.new
    end
  end
end
