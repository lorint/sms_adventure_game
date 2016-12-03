json.extract! role, :id, :name, :is_admin, :is_moderator, :is_creator, :created_at, :updated_at
json.url role_url(role, format: :json)