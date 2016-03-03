json.array!(@campo_extras) do |campo_extra|
  json.extract! campo_extra, :id, :label, :campo_tipo, :user_id
  json.url campo_extra_url(campo_extra, format: :json)
end
