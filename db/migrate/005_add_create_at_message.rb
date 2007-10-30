class AddCreateAtMessage < ActiveRecord::Migration
  def self.up
      add_column :messages, :created_at, :datetime
  end

  def self.down
      remove_column :messages, :created_at
  end
end
