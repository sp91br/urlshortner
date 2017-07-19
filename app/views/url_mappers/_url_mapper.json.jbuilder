json.extract! url_mapper, :id, :longurl, :created_at, :updated_at
json.url url_mapper_url(url_mapper, format: :json)
