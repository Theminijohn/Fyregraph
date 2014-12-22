json.array!(@messages) do |message|
  json.extract! message, :id, :body, :bug, :references, :references, :references
  json.url message_url(message, format: :json)
end
