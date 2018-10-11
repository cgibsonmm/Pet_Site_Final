FactoryBot.define do
  factory :photo_post do
    caption { 'MyString' }
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/pet_photo.jpg', 'image/jpg') }
  end
end
