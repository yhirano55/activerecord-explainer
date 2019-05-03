# frozen_string_literal: true

require 'active_record'

require_relative 'explainer/version'

begin
  require 'rails'
  require_relative 'explainer/railtie'
rescue LoadError
  nil
end

module ActiveRecord
  module Explainer # :nodoc:
  end
end
