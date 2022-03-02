json.extract! question, :id, :titile, :content, :name, :finished, :created_at, :updated_at
json.url question_url(question, format: :json)
