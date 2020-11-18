json.extract! message, :id, :author, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
