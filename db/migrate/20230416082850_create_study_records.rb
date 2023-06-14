class CreateStudyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :study_records do |t|
      t.references :user, null: false, foreign_key: true
      t.text :grade1, null: false
      t.text :grade2, null: false
      t.text :grade3, null: false
      t.text :grade4, null: false
      t.text :grade5, null: false
      t.text :grade6, null: false

      t.timestamps
    end
  end
end
