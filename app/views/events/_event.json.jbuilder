json.extract! event, :id, :description, :type_event, :formula, :inss, :irrf, :rpps, :created_at, :updated_at
json.url event_url(event, format: :json)
