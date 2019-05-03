# frozen_string_literal: true

module ActiveRecord
  module Explainer
    class Railtie < ::Rails::Railtie # :nodoc:
      config.after_initialize do
        ActiveSupport.on_load :active_record do
          require_relative 'subscriber'

          ActiveRecord::Explainer.config.logger = Rails.logger
          ActiveRecord::Explainer::Subscriber.attach_to :active_record
        end
      end
    end
  end
end
