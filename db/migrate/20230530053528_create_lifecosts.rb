class CreateLifecosts < ActiveRecord::Migration[6.1]
  def change
    create_table :lifecosts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :twenty, null: false, default: 3000000
      t.integer :thirty, null: false, default: 4000000
      t.integer :forty, null: false, default: 5000000
      t.integer :fifty, null: false, default: 6000000
      t.integer :sixty, null: false, default: 2000000

      t.integer :marriage, null: false, default: 0
      t.integer :child, null: false, default: 0
      t.integer :house, null: false, default: 0
      t.integer :car, null: false, default: 0
      t.integer :care, null: false, default: 0

      t.integer :rent, null: false, default: 0
      t.integer :utility, null: false, default: 0
      t.integer :internet, null: false, default: 0
      t.integer :insurance, null: false, default: 0
      t.integer :car_cost, null: false, default: 0
      t.integer :child_care, null: false, default: 0
      t.integer :lesson, null: false, default: 0
      t.integer :transport, null: false, default: 0
      t.integer :pocket_money, null: false, default: 0
      t.integer :other_cost, null: false, default: 0
      t.integer :food, null: false, default: 0
      t.integer :necessity, null: false, default: 0
      t.integer :medical_cost, null: false, default: 0
      t.integer :child_lesson, null: false, default: 0
      t.integer :clothes, null: false, default: 0
      t.integer :beauty, null: false, default: 0
      t.integer :companionship, null: false, default: 0
      t.integer :entertainment, null: false, default: 0
      t.integer :small_cost, null: false, default: 0
      t.integer :exception, null: false, default: 0
      t.integer :marriage_total, null: false, default: 5130000
      t.integer :child_total, null: false, default: 12750000
      t.integer :house_total, null: false, default: 39450000
      t.integer :car_total, null: false, default: 15000000
      t.integer :insurance_total, null: false, default: 9640000
      t.integer :retire_total, null: false, default: 57600000
      t.integer :tax, null: false, default: 20
      t.integer :pension, null: false, default: 0

      t.timestamps
    end
  end
end
