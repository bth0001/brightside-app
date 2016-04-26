json.array!(@brightsides) do |brightside|
  json.extract! brightside, :id, :title, :entry
  json.url brightside_url(brightside, format: :json)
end
