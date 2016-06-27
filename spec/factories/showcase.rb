FactoryGirl.define do
  factory :showcase do
    name "Lorem ipsum dolor sit amet"
    header_img_url "http://example.com/test.png"
    album_url "http://example.com/"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolor"
    slug ""
    user
  end
end
