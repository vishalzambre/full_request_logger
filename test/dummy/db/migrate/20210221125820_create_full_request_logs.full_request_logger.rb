# This migration comes from full_request_logger (originally 20210221114450)
class CreateFullRequestLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :full_request_logs do |t|
      t.string :request_id
      t.text :body
    end
  end
end
