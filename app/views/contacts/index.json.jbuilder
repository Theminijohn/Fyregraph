json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :mobile_phone, :home_phone
  json.url contact_url(contact, format: :json)
end
