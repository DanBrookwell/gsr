json.array!(@experiences) do |experience|
  json.extract! experience, :id, :details, :guest_id
  json.url experience_url(experience, format: :json)
end
