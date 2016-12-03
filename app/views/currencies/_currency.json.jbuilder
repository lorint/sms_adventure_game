json.extract! currency, :id, :name, :exchange_rate, :ease_of_use, :created_at, :updated_at
json.url currency_url(currency, format: :json)