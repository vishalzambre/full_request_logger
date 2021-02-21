require "zlib"

module FullRequestLogger::DataAdapters
  class ActiveRecordAdapter < BaseAdapter
    def write(**args)
      FullRequestLog.create(request_id: request_key(args[:request_id]), body: args[:body])
    end

    def find(id)
      FullRequestLog.find_by(request_id: request_key(id))
    end

    def all(page: 1, per_page: 50, query: nil)
      if query.present?
        FullRequestLog.where("body like ?", "%#{query}%").paginate(page: page, per_page: per_page)
      else
        FullRequestLog.paginate(page: page, per_page: per_page)
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
