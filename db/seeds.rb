# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."

Tag.destroy_all
print "."

puts "Database cleaned!"

puts "Creating tags..."

tag_entre_amis = Tag.create!(title: "entre amis")
print "."

puts "Tags created!"
