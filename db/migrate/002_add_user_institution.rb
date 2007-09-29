class AddUserInstitution < ActiveRecord::Migration
  def self.up
    add_column :institutions, :user_who_create, :integer
  end

  def self.down
    remove_column :institutions, :user_who_create
  end
end
