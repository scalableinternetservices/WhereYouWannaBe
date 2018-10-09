json.extract! event, :id, :title, :description, :tag_id, :location_id, :date, :price, :creator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
