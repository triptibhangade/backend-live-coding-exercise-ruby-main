# frozen_string_literal: true

json.extract! question, :id, :title, :answer, :created_at, :updated_at
json.url question_url(question, format: :json)
