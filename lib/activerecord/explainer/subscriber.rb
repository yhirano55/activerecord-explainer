require 'active_support/subscriber'

module ActiveRecord
  module Explainer
    class Subscriber < ActiveSupport::Subscriber # :nodoc:
      def sql(event)
        payload = event.payload
        return if ignore_payload?(payload) || !ActiveRecord::Base.connection.supports_explain?

        logger.debug exec_explain(sql: payload[:sql], binds: payload[:binds])
      end

      private

      IGNORED_PAYLOADS = %w[SCHEMA EXPLAIN].freeze
      EXPLAINED_SQLS = /\A\s*(with|select|update|delete|insert)\b/i.freeze

      def ignore_payload?(payload)
        payload[:cached] ||
          IGNORED_PAYLOADS.include?(payload[:name]) ||
          payload[:sql] !~ EXPLAINED_SQLS
      end

      def exec_explain(sql:, binds:)
        msg = +"EXPLAIN for: #{sql}"
        unless binds.empty?
          msg << ' '
          msg << binds.map { |attr| render_bind(attr) }.inspect
        end
        msg << "\n"
        msg << ActiveRecord::Base.connection.explain(sql, binds)
        msg
      end

      def render_bind(attr)
        value =
          if attr.type.binary? && attr.value
            "<#{attr.value_for_database.to_s.bytesize} bytes of binary data>"
          else
            ActiveRecord::Base.connection.type_cast(attr.value_for_database)
          end

        [attr.name, value]
      end

      def logger
        ActiveRecord::Explainer.config.logger
      end
    end
  end
end
