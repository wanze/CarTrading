json.array!(@cars) do |car|
  json.extract! car, :id, :title, :description, :image, :user_id, :type_id, :age, :mileage, :brand_id, :color_id
  json.url car_url(car, format: :json)
end
