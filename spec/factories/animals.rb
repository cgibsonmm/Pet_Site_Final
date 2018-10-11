FactoryBot.define do
  factory :animal do
    name { "MyDog" }
    user { 1 }
    dob { "2018-04-12 14:37:59" }
    species { "dog" }
  end
end
