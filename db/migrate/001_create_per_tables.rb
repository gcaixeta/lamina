class CreatePerTables < ActiveRecord::Migration
  def self.up

  create_table "institutions" do |t|
    t.column "name",     :string, :null => false
    t.column "cnpj",     :integer, :null => false
    t.column "telephone", :integer, :null => false
    t.column "email",    :string, :null => false
    t.column "active",   :boolean, :default => false
  end


  create_table "profiles" do |t|
    t.column "description", :string, :null => false

  end





  create_table "states" do |t|
    t.column "name", :string, :null => false

  end


  create_table "cities" do |t|
    t.column "state_id", :integer, :null => false
    t.column "name",      :string, :null => false

  end


  create_table "users" do |t|
    t.column "city_id",                 :integer, :null => false
    t.column "name",                      :string
    t.column "login",                     :string, :null => false
    t.column "email",                     :string
    t.column "crypted_password",          :string, :limit => 40
    t.column "birth",                     :datetime
    t.column "lastacess",                 :datetime
    t.column "salt",                      :string, :limit => 40
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
  end



  create_table "registrations" do |t|
    t.column "profile_id",     :integer, :null => false
    t.column "user_id",        :integer, :null => false
    t.column "institution_id", :integer, :null => false
  end



  create_table "configurations" do |t|
    t.column "number_participants", :integer
    t.column "questions_max",       :integer
  end



  create_table "themes" do |t|
    t.column "configuration_id", :integer, :null => false
    t.column "name",              :string, :null => false
    t.column "summary",           :string, :null => false
    t.column "create_at",         :datetime
    t.column "active",            :boolean, :null => false
    t.column "password",          :string
  end


  create_table "archives" do |t|
    t.column "theme_id",   :string, :null => false
    t.column "name",        :string, :null => false
    t.column "description", :string
    t.column "heading",     :string
  end

  create_table "links" do |t|
    t.column "theme_id",   :integer, :null => false
    t.column "address",     :string, :null => false
    t.column "description", :string, :null => false
  end


  create_table "proposals" do |t|
    t.column "theme_id",        :integer, :null => false
    t.column "registration_id", :integer, :null => false
    t.column "active",           :boolean, :default => false
  end

  create_table "groups" do |t|
    t.column "theme_id", :integer, :null => false
    t.column "name",      :string, :null => false
  end


  create_table "participations" do |t|
    t.column "group_id",        :integer, :null => false
    t.column "registration_id", :integer, :null => false
    t.column "leader",            :boolean, :default => false
  end


  create_table "messages" do |t|
    t.column "participation_id", :integer, :null => false
    t.column "messages",               :text, :null => false
  end



  create_table "questions"  do |t|
    t.column "text", :text, :null => false
  end

  create_table "answers" do |t|
    t.column "question_id", :integer, :null => false
    t.column "text",       :text, :null => false
    t.column "correct",    :boolean, :default => false, :null => false
  end


  create_table "interactions" do |t|
    t.column "participation_id", :integer, :null => false
    t.column "answer_id",             :integer, :null => false
    t.column "question_id",           :integer, :null => false
    t.column "created_at",    :datetime
  end




  create_table "games" do |t|
    t.column "theme_id",      :integer, :null => false
    t.column "date_begin", :date, :null => false
    t.column "concluded",     :boolean, :default => false
    t.column "victory_id",     :integer, :null => true
  end


  create_table "players" do |t|
    t.column "game_id",     :integer, :null => false
    t.column "group_id",     :integer, :null => false
  end



  create_table "plays" do |t|
    t.column "player_id",         :integer, :null => false
    t.column "question_id",     :integer, :null => false
    t.column "answer_id",       :integer, :null => true
  end


  end

  def self.down
    drop_table "plays"
    drop_table "players"
    drop_table "games"
    drop_table "interactions"
    drop_table "questions"
    drop_table "answers"
    drop_table "messages"
    drop_table "participations"
    drop_table "groups"
    drop_table "proposals"
    drop_table "links"
    drop_table "archives"
    drop_table "themes"
    drop_table "configurations"
    drop_table "registrations"
    drop_table "users"
    drop_table "cities"
    drop_table "states"
    drop_table "profiles"
    drop_table "institutions"
 
  end
end
