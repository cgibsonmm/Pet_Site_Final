class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.datetime :dob
      t.string :species

      t.timestamps
    end
  end
end
