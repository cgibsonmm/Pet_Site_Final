FactoryBot.define do
    factory :user do
      email 'test@test.com'
      user_name 'testuser'
      password 'testpassword'
      id 1
    end

    factory :user_2 do
      email 'test1@test.com'
      user_name 'testuser1'
      password 'testpassword'
      id 2
    end
  end
