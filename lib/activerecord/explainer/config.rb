# frozen_string_literal: true

require 'logger'

module ActiveRecord
  module Explainer
    class Config # :nodoc:
      attr_accessor :logger

      def initialize
        @logger = Logger.new(STDOUT)
      end
    end
  end
end
