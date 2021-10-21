json.extract! bookmark, :id, :name, :url, :variety_id, :category_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
