json.extract! location, :id, :address, :city, :capacity, :email, :phone, :created_at, :updated_at
json.url location_url(location, format: :json)
