class CreateNewsCats < ActiveRecord::Migration[6.1]
  def change
    create_table :news_cats do |t|
      t.string :name

      t.timestamps
    end
  end
end
