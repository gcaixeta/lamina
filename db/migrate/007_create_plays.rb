class CreatePlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.column :player_id, :integer
      t.column :question_id, :integer
      t.column :answer_id, :integer
    end
  end

  def self.down
    drop_table :plays
  end
end
