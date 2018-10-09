json.extract! attendee, :id, :event_id, :user_id, :guests_count, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
