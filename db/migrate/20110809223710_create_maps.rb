class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :marker_name
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
