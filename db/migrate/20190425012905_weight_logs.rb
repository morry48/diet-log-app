class WeightLogs < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_wights
  end
end