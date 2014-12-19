json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :body, :references, :references
  json.url campaign_url(campaign, format: :json)
end
