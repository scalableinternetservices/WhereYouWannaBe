json.extract! user, :id, :name, :age, :home_address, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
