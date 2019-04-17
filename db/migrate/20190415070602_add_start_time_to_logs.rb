class AddStartTimeToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :start_time, :datetime
  end
end
