class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.column :data_begin, :date
      t.column :concluded, :boolean
      t.column :victory_id, :integer
    end
  end

  def self.down
    drop_table :games
  end
end
