json.extract! subject, :id, :topic, :description, :status, :created_at, :updated_at
json.url subject_url(subject, format: :json)
