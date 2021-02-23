# frozen_string_literal: true

require 'zlib'

module FullRequestLogger
  module DataAdapters
    class ActiveRecordAdapter < BaseAdapter
      def write(**args)
        FullRequestLog.create(request_id: request_key(args[:request_id]), body: args[:body])
      end

      def find(id)
        FullRequestLog.find_by(request_id: request_key(id))
      end

      def all(page: 1, per_page: 50, query: nil)
        if query.present?
          FullRequestLog.where('body like ?', "%#{query}%")
                        .order('created_at desc').paginate(page: page, per_page: per_page)
        else
          FullRequestLog.order('created_at desc').paginate(page: page, per_page: per_page)
        end
      end

      def clear
        FullRequestLog.destroy_all
      end

      class FullRequestLog < ActiveRecord::Base
        self.table_name = 'full_request_logs'
      end
    end
  end
end
