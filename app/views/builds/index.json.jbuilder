json.array!(@builds) do |build|
  json.extract! build, :id, :b_type, :name, :spec, :mb, :cpu, :gpu, :ram, :disk, :chassis, :cost, :os, :im, :status, :body
  json.url build_url(build, format: :json)
end
