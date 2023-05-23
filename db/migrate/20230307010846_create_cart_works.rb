class CreateCartWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_works do |t|
      t.references :cart, foreign_key: true
      t.references :work, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
