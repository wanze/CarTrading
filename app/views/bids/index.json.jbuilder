json.array!(@bids) do |bid|
  json.extract! bid, :id, :user_id, :offer_id, :placed_by, :timestamp, :price
  json.url bid_url(bid, format: :json)
end
