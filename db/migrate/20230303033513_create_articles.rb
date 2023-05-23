class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :article_cat, foreign_key: true
      t.string :title
      t.string :image
	    t.string :image_title
      t.text :text
      
      t.timestamps
    end
  end
end
