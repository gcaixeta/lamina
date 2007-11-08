class AddTableObservation < ActiveRecord::Migration
  def self.up
    create_table "observation", :force => true do |t|
    t.column "text", :text
  end
  end

  def self.down
      drop_table "observation"
  end
end
