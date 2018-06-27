class CreateShotRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_records do |t|
      t.references :animal, foreign_key: true
      t.string :name
      t.date :due_date
      t.date :date_recived
      t.integer :frequency
      t.text :notes

      t.timestamps
    end
  end
end
