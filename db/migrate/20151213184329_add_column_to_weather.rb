class AddColumnToWeather < ActiveRecord::Migration
  def change
    add_column :weathers, :city, :string
    add_column :weathers, :region, :string
    add_column :weathers, :country, :string
  end
end
