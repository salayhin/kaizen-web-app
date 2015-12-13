class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.float :lat
      t.float :long
      t.string :info
      t.string :picture
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
