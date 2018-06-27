class AddMedicalHistoryToAnimals < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :medical_history, :text
  end
end
