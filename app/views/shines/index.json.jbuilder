json.array!(@shines) do |shine|
  json.extract! shine, :id, :title, :completed
  json.url shine_url(shine, format: :json)
end
