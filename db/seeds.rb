# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Todo.create(id: 1, title: "Buy food: milk, bread, fruits", status: true)
# Todo.create(id: 2, title: "Imagine Dragons tickets", status: false)
Todo.create({ "id"=>"1", "title"=>"drink water", "status"=> true })
Todo.create({ "id"=>"2", "title"=>"drink tea", "status"=> false })
Todo.create({ "id"=>"2", "title"=>"drink tea" })
