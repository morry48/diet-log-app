class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :name
      t.float :protein
      t.float :fat
      t.float :carbohydrate

      t.timestamps
    end
  end
end
