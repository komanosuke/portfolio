class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.references :post, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
