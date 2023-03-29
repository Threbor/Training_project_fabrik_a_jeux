# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."

OrderedItem.destroy_all
print "."
Order.destroy_all
print "."
JoinDishesTag.destroy_all
print "."
Tag.destroy_all
print "."
Dish.destroy_all
print "."
User.destroy_all
print "."

puts "Database cleaned!"

# tags
puts "Creating tags..."

tag_entre_amis = Tag.create!(title: "entre amis")
print "."

tag_assiettes = Tag.create!(title: "les_assiettes")
print "."

tag_salé = Tag.create!(title: "salé")
print "."

tag_sucré = Tag.create!(title: "sucré")
print "."

tag_plat = Tag.create!(title: "plat")
print "."

tag_dessert = Tag.create!(title: "dessert")
print "."

tag_soft = Tag.create!(title: "soft")
print "."

tag_sirop_giffard = Tag.create!(title: "sirpo giffard")
print "."

tag_jus_de_fruit_granini = Tag.create!(title: "Jus de fruit granini")
print "."

puts "Tags created!"

# Dishes
puts "Creating dishes..."
dish_chips = Dish.create!(
  title: "chips",
  price: 150,
  description: "(27,5g)"
)
print "."

dish_des_de_frommage = Dish.create!(
  title: "dés de frommage",
  price: 250,
  description: "(100g)"
)
print "."

dish_coupelle_de_bonbons = Dish.create!(
  title: "coupelle de bonbons",
  price: 350,
  description: "(140g)"
)
print "."

dish_breizh_cola = Dish.create!(
  title: "breizh cola",
  price: 350,
  description: "(33cl)"
)
print "."

puts "dishes created!"

# JoinDishesTag
puts "Creating JoinDishesTag..."

JoinDishesTag.create!(
  dish: dish_chips,
  tag: tag_assiettes,
)
print "."

JoinDishesTag.create!(
  dish: dish_chips,
  tag: tag_salé,
)
print "."

JoinDishesTag.create!(
  dish: dish_des_de_frommage,
  tag: tag_assiettes,
)
print "."

JoinDishesTag.create!(
  dish: dish_des_de_frommage,
  tag: tag_salé,
)
print "."


JoinDishesTag.create!(
  dish: dish_coupelle_de_bonbons,
  tag: tag_assiettes,
)
print "."

JoinDishesTag.create!(
  dish: dish_coupelle_de_bonbons,
  tag: tag_sucré,
)
print "."

JoinDishesTag.create!(
  dish: dish_breizh_cola,
  tag: tag_soft,
)
print "."


puts "dishes JoinDishesTag!"

#users

puts "Creating users..."

user_admin = User.create!(
  email: "admin@mail.com",
  password: "123456",
  role: "admin"
)
print "."

user_client1 = User.create!(
  email: "client1@mail.com",
  password: "123456",
  role: "client"
)
print "."

puts "users created!"


#orders

puts "Creating orders..."

order1_client1 = Order.create!(
  user: user_client1,
  status: "payed"
)
print "."

order2_client1 = Order.create!(
  user: user_client1
)
print "."

puts "orders created!"


#Ordered_items

puts "Creating Ordered_items..."

order1_client1_item1 = OrderedItem.create!(
  order: order1_client1,
  dish: dish_chips
)
print "."

order1_client1_item2 = OrderedItem.create!(
  order: order1_client1,
  dish: dish_breizh_cola
)
print "."

order2_client1_item2 = OrderedItem.create!(
  order: order2_client1,
  dish: dish_breizh_cola
)
print "."

puts "Ordered_items created!"
