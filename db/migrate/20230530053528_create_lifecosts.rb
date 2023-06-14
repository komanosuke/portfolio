class CreateLifecosts < ActiveRecord::Migration[6.1]
  def change
    create_table :lifecosts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :twenty, null: false
      t.integer :thirty, null: false
      t.integer :forty, null: false
      t.integer :fifty, null: false
      t.integer :sixty, null: false

      t.integer :marriage, null: false
      t.integer :child, null: false
      t.integer :house, null: false
      t.integer :car, null: false
      t.integer :care, null: false

      t.integer :rent, null: false
      t.integer :utility, null: false
      t.integer :internet, null: false
      t.integer :insurance, null: false
      t.integer :car_cost, null: false
      t.integer :child_care, null: false
      t.integer :lesson, null: false
      t.integer :transport, null: false
      t.integer :pocket_money, null: false
      t.integer :other_cost, null: false
      t.integer :food, null: false
      t.integer :necessity, null: false
      t.integer :medical_cost, null: false
      t.integer :child_lesson, null: false
      t.integer :clothes, null: false
      t.integer :beauty, null: false
      t.integer :companionship, null: false
      t.integer :entertainment, null: false
      t.integer :small_cost, null: false
      t.integer :exception, null: false
      t.integer :marriage_total, null: false
      t.integer :child_total, null: false
      t.integer :house_total, null: false
      t.integer :car_total, null: false
      t.integer :tax, null: false
      t.integer :pension, null: false

      t.timestamps
    end
  end
end
