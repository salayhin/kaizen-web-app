class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.float :lat
      t.float :long
      t.text :message
      t.string :photo
      t.integer :user_id
      t.string :city
      t.string :region
      t.string :country

      t.timestamps null: false
    end
  end
end
