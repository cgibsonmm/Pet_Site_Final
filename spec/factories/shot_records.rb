FactoryBot.define do
  factory :shot_record do
    animal { nil }
    name { "MyString" }
    due_date { "2018-06-18" }
    date_recived { "2018-06-18" }
    frequency { 1 }
    notes { "MyText" }
  end
end
