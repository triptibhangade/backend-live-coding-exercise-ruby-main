# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
questions = [
  'Can you code in Ruby?',
  'Can you code in JavaScript?',
  'Can you code in Swift?',
  'Can you code in Java?',
  'Can you code in C#?'
]

questions.each { |title| Question.create(title:) }
