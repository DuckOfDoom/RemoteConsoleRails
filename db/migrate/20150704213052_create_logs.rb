class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :device_id
      t.string :build_id
      t.string :log_type
      t.string :log
      t.string :stack_trace
      t.datetime :timestamp

      t.timestamps
    end
  end
end
