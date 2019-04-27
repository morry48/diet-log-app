class CreateWeightLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_logs do |t|
      t.float :weight, null: false
      t.datetime :start_time, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
