class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.references :work_cat, foreign_key: true, null: false
      t.string :title
      t.string :image
      t.integer :price
      t.text :text
      t.integer :onlyone
      t.integer :status
      
      t.timestamps
    end
  end
end
