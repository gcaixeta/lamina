class AddColumnsApprovedActivity < ActiveRecord::Migration
  def self.up
      add_column :activities, :approved, :boolean, :default => false
  end

  def self.down
      remove_column :activities, :approved
  end
end
