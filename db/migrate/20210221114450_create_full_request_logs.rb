class CreateFullRequestLogs < ActiveRecord::Migration
  def change
    create_table :full_request_logs do |t|
      t.string :request_id
      t.text :body
      t.timestamps
    end
  end
end
