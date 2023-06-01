class CreateLifecosts < ActiveRecord::Migration[6.1]
  def change
    create_table :lifecosts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :twenty
      t.integer :thirty
      t.integer :forty
      t.integer :fifty
      t.integer :sixty

      t.integer :marriage
      t.integer :child
      t.integer :house
      t.integer :car
      t.integer :care

      t.integer :rent
      t.integer :utility
      t.integer :internet
      t.integer :insurance
      t.integer :car_cost
      t.integer :child_care
      t.integer :lesson
      t.integer :transport
      t.integer :pocket_money
      t.integer :other_cost
      t.integer :food
      t.integer :necessity
      t.integer :medical_cost
      t.integer :child_lesson
      t.integer :clothes
      t.integer :beauty
      t.integer :companionship
      t.integer :entertainment
      t.integer :small_cost
      t.integer :exception
      t.integer :marriage_total
      t.integer :child_total
      t.integer :house_total
      t.integer :car_total
      t.integer :tax
      t.integer :pension

      t.timestamps
    end
  end
end
