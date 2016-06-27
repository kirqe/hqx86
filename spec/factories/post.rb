FactoryGirl.define do
  factory :post do
    title "Lorem ipsum dolor sit amet"
    header_img_url "http://example.com/test.png"
    body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolor"
    slug ""
    published true
    tweeted false
    user
    catergory
  end
end
