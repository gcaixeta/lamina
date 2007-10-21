# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 4) do

  create_table "answers", :force => true do |t|
    t.column "question_id", :integer,                    :null => false
    t.column "text",        :text,    :default => "",    :null => false
    t.column "correct",     :boolean, :default => false, :null => false
  end

  create_table "archives", :force => true do |t|
    t.column "theme_id",    :string, :default => "", :null => false
    t.column "name",        :string, :default => "", :null => false
    t.column "description", :string
    t.column "heading",     :string
  end

  create_table "cities", :force => true do |t|
    t.column "state_id", :integer,                 :null => false
    t.column "name",     :string,  :default => "", :null => false
  end

  create_table "configurations", :force => true do |t|
    t.column "number_participants", :integer
    t.column "questions_max",       :integer
  end

  create_table "games", :force => true do |t|
    t.column "theme_id",   :integer,                    :null => false
    t.column "date_begin", :date,                       :null => false
    t.column "concluded",  :boolean, :default => false
    t.column "victory_id", :integer
  end

  create_table "groups", :force => true do |t|
    t.column "theme_id", :integer,                 :null => false
    t.column "name",     :string,  :default => "", :null => false
  end

  create_table "institutions", :force => true do |t|
    t.column "name",            :string,  :default => "",    :null => false
    t.column "cnpj",            :integer,                    :null => false
    t.column "telephone",       :integer,                    :null => false
    t.column "email",           :string,  :default => "",    :null => false
    t.column "active",          :boolean, :default => false
    t.column "user_who_create", :integer
  end

  create_table "interactions", :force => true do |t|
    t.column "participation_id", :integer,  :null => false
    t.column "answer_id",        :integer,  :null => false
    t.column "question_id",      :integer,  :null => false
    t.column "created_at",       :datetime
  end

  create_table "links", :force => true do |t|
    t.column "theme_id",    :integer,                 :null => false
    t.column "address",     :string,  :default => "", :null => false
    t.column "description", :string,  :default => "", :null => false
  end

  create_table "messages", :force => true do |t|
    t.column "participation_id", :integer,                 :null => false
    t.column "messages",         :text,    :default => "", :null => false
  end

  create_table "participations", :force => true do |t|
    t.column "group_id",        :integer,                    :null => false
    t.column "registration_id", :integer,                    :null => false
    t.column "leader",          :boolean, :default => false
  end

  create_table "players", :force => true do |t|
    t.column "game_id",  :integer, :null => false
    t.column "group_id", :integer, :null => false
  end

  create_table "plays", :force => true do |t|
    t.column "player_id",   :integer, :null => false
    t.column "question_id", :integer, :null => false
    t.column "answer_id",   :integer
  end

  create_table "profiles", :force => true do |t|
    t.column "description", :string, :default => "", :null => false
  end

  create_table "proposals", :force => true do |t|
    t.column "theme_id",        :integer,                    :null => false
    t.column "registration_id", :integer,                    :null => false
    t.column "active",          :boolean, :default => false
  end

  create_table "questions", :force => true do |t|
    t.column "text", :text, :default => "", :null => false
  end

  create_table "registrations", :force => true do |t|
    t.column "profile_id",     :integer, :null => false
    t.column "user_id",        :integer, :null => false
    t.column "institution_id", :integer, :null => false
  end

  create_table "states", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.column "tag_id",        :integer
    t.column "taggable_id",   :integer
    t.column "taggable_type", :string
    t.column "created_at",    :datetime
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.column "name", :string
  end

  create_table "themes", :force => true do |t|
    t.column "configuration_id", :integer,                  :null => false
    t.column "name",             :string,   :default => "", :null => false
    t.column "summary",          :string,   :default => "", :null => false
    t.column "create_at",        :datetime
    t.column "active",           :boolean,                  :null => false
    t.column "password",         :string
  end

  create_table "users", :force => true do |t|
    t.column "city_id",                   :integer,                                   :null => false
    t.column "name",                      :string
    t.column "login",                     :string,                 :default => "",    :null => false
    t.column "email",                     :string
    t.column "crypted_password",          :string,   :limit => 40
    t.column "birth",                     :datetime
    t.column "lastacess",                 :datetime
    t.column "salt",                      :string,   :limit => 40
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
    t.column "admin",                     :boolean,                :default => false
  end

end
