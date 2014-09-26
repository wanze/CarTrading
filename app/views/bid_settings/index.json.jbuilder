json.array!(@bid_settings) do |bid_setting|
  json.extract! bid_setting, :id, :offer_id, :user_id, :automatic, :max_amount
  json.url bid_setting_url(bid_setting, format: :json)
end
