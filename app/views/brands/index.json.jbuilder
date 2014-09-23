json.array!(@brands) do |brand|
  json.extract! brand, :id, :title
  json.url brand_url(brand, format: :json)
end
