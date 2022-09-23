json.extract! coin, :id, :name, :price_usd, :created_at, :updated_at
json.url coin_url(coin, format: :json)
