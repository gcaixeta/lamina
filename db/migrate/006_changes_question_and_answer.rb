class ChangesQuestionAndAnswer < ActiveRecord::Migration
  def self.up
  #interactions
    create_table :activities do |t| #activity activities
      t.column :creation_type, :string, :null => false
      t.column :creation_id, :integer, :null => false
      t.column :participation_id, :integer, :null => false
    end
    
    remove_column :interactions, :question_id
    remove_column :interactions, :answer_id
    
    #TODO Add to Fixtures, etc
    add_column :interactions, :action_type, :string, :null => false, :default =>"new"
    add_column :interactions, :activity_id, :integer, :null => false
    
  end

  def self.down

    
		remove_column :interactions, :action_type
		remove_column :interactions, :activity_id

    add_column :interactions, :question_id, :integer, :null => false
    add_column :interactions, :answer_id, :integer, :null => false

		
		drop_table :activities

    
    
  end
end
