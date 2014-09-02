class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.column :line_id, :int
      t.column :station_id, :int
    end
  end
end
