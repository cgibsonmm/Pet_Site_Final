json.extract! animal, :id, :name, :user_id, :dob, :species, :created_at, :updated_at
json.url animal_url(animal, format: :json)
