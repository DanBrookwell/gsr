json.array!(@guests) do |guest|
  json.extract! guest, :id, :first_name, :last_name, :email, :phone
  json.url guest_url(guest, format: :json)
end
