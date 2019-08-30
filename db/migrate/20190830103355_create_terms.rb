class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :term
      t.string :pig_latin
      
      t.timestamps
    end
  end
end
