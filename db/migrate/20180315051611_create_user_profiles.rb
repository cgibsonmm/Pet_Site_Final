class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.integer :birthday
      t.string :sex

      t.timestamps
    end
    add_index :user_profiles, :zip_code
  end
end
