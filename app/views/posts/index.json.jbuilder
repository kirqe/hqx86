json.array!(@posts) do |post|
  json.extract! post, :id, :title, :header_img_url, :body, :category_id
  json.url post_url(post, format: :json)
end
