class CreateTableForUsers < ActiveRecord::Migration
  def change
    
    create_table :users do |t|
      t.text :username
      t.text :password_hash
    end
    
  end
end
