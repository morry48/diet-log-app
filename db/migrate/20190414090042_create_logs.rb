class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :name, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbohydrate, null: false
      t.datetime :start_time , null: false
      t.timestamps
    end
  end
end
