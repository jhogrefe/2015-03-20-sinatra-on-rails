class CreateTableForTerms < ActiveRecord::Migration
  def change
    
    create_table :terms do |t|
      t.text :term
    end
    
  end
end
