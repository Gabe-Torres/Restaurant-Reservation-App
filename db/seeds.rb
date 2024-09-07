# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Table.create([
  { number: "T1", capacity: 2 },
  { number: "T2", capacity: 2 },
  { number: "T3", capacity: 4 },
  { number: "T4", capacity: 4 },
  { number: "T5", capacity: 6 },
  { number: "T6", capacity: 6 },
  { number: "T7", capacity: 8 },
  { number: "T8", capacity: 8 },
  { number: "T9", capacity: 4 },
  { number: "T10", capacity: 2 }
])
