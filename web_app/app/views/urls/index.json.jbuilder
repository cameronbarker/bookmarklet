json.array!(@urls) do |url|
  json.extract! url, :id, :url, :keywords, :default_note, :string
  json.url url_url(url, format: :json)
end
