class CreateTableForTranslations < ActiveRecord::Migration
  def change
    
    create_table :translators do |t|
      t.integer :term_id
      t.integer :lang_id
      t.text :translator
    end
    
  end
end
