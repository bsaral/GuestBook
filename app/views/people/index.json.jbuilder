json.array!(@people) do |person|
  json.extract! person, :id, :id, :name, :message
  json.url person_url(person, format: :json)
end
