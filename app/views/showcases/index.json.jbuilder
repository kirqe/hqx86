json.array!(@showcases) do |showcase|
  json.extract! showcase, :id, :name, :header_img_url, :album_url, :description, :user_id, :slug
  json.url showcase_url(showcase, format: :json)
end
