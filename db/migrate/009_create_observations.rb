class CreateObservations < ActiveRecord::Migration
  def self.up
    create_table :observations do |t|
    t.column "text", :text, :null => false
    t.column "activity_id",:integer, :null => false
    end
  end

  def self.down
    drop_table :observations
  end
end
