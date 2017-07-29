FactoryGirl.define do
  factory :post do
    caption "test"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images.jpeg', 'image/jpg')
  end
end
