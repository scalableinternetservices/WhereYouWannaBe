json.extract! comment, :id, :message, :event_id, :user_id, :date, :created_at, :updated_at
json.url comment_url(comment, format: :json)
