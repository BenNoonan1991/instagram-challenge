FactoryGirl.define do
  factory :post do
    caption "Test"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images.jpeg', 'image/jpg')
    user
  end
end
