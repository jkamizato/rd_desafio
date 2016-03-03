json.array!(@contatos) do |contato|
  json.extract! contato, :id, :email, :user_id
  json.url contato_url(contato, format: :json)
end
