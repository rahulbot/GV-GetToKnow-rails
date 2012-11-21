class AddLatLonToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :latitude, :double
    add_column :countries, :longitude, :double
  end
end
