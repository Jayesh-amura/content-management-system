class CreateUsers < ActiveRecord::Migration
  #--------TYPE-----------
  #binary boolean date datetime decimal
  #float integer string text time

  #--------OPTIONS--------
  # :limit => size
  # :default => value
  # :null => true/false
  # :precision => number
  # :scale => number
  # :default => ""

  #-------OPTIONS for index---------
  # :unique => true/false
  # :name => "your_custom_name"

  def up
    create_table :users do |t|
      #t.column "name", :type, options
      #t.type "name", options
      t.column "first_name", :string , :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      # t.datetime "created_at"
      # t.datetime "updated_at"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end

end
