FactoryGirl.define do
  factory :post do
    name "Name of Post"
    image Rack::Test::UploadedFile.new(File.open(Rails.root.join('spec', 'images', 'example.jpeg')))
    #image { fixture_file_upload(Rails.root.join('spec', 'images', 'example.jpeg'), 'image/jpeg') }
  end
end