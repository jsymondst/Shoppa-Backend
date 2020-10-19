# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jamie = User.create(username: "jamie", password: "jamie")

puts "created Jamie"

list_one = List.create(name: "Example List")

Right.create(user:jamie, list: list_one)

puts "created list one"

list_one_items = [
    {name: 'burgers', category: 'Meat'}, 
    {name: 'sausages', category: 'Meat'}, 
    {name: 'burger buns', category: 'Bread'}, 
    {name: 'lettuce', category: 'Produce'},
    {name: 'tomatoes', category: 'Produce'},
]

list_one_items.each{|item|
    Item.create(list: list_one, name:item[:name], category:item[:category])
}

puts "added items to list one."
