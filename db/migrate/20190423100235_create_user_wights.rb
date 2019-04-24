class CreateUserWights < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wights do |t|
      t.float :wight,null: false
      t.datetime :start_time
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
