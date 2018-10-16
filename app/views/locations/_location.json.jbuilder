json.extract! location, :id, :name,:address, :city, :capacity, :email, :phone, :created_at, :updated_at
json.url location_url(location, format: :json)
