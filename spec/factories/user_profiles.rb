FactoryBot.define do
  factory :user_profile do
    first_name 'default'
    last_name 'default'
    zip_code 11111
    city 'Brooklyn'
    state 'Ny'
    country 'United States'
    birthday 1989
    sex 'male'
  end
end
