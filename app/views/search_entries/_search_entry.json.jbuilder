json.extract! search_entry, :id, :title, :body, :searchable_id, :searchable_type, :created_at, :updated_at
json.url search_entry_url(search_entry, format: :json)
