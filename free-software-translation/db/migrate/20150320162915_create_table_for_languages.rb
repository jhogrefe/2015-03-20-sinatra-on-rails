class CreateTableForLanguages < ActiveRecord::Migration
  def change
    
    create_table :langs do |t|
      t.text :lang
    end
    
  end
end
