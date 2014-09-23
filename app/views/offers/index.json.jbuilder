json.array!(@offers) do |offer|
  json.extract! offer, :id, :car_id, :start, :end, :price, :minimum_step, :contact_details
  json.url offer_url(offer, format: :json)
end
