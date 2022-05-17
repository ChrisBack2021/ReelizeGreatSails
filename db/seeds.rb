# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Profile.destroy_all
User.destroy_all
Reel.destroy_all
Brand.destroy_all
ReelType.destroy_all



first_user = User.create!(email: 'admin@test.com', password: '123321')
Profile.create(first_name: 'Admin', last_name: 'Admin', age: 51, user_id: 1)
first_user.add_role :admin

second_user = User.create!(email: 'foo@bar.com', password: '123321')
Profile.create(first_name: 'Foo', last_name: 'Bar', age: 15, user_id: 2)
second_user.add_role :customer

Profile.create(first_name: 'Jerry', last_name: "One", age: 21)

shim = Brand.create(brand: "Shimano")
dai = Brand.create(brand: "Daiwa")

spin = ReelType.create(reel_type: "Spinning")
oh = ReelType.create(reel_type: "Overhead")

Reel.create!(item_name: "Certate", size: "5000", description: "Great", price: "700", item_condition: "good", brand: dai, reel_type: spin, user: second_user)
Reel.create(item_name: "Exist", size: "2500", description: "Great", price: "800", item_condition: "good", brand: dai, reel_type: spin, user: second_user)
Reel.create(item_name: "Saltiga", size: "5000", description: "Great", price: "1200", item_condition: "good", brand: dai, reel_type: spin, user: second_user)

Reel.create(item_name: "Stella", size: "10000", description: "Great", price: "1100", item_condition: "good", brand: shim, reel_type: spin, user: second_user)
Reel.create(item_name: "Vanford", size: "3000", description: "Great", price: "250", item_condition: "good", brand: shim, reel_type: spin, user: second_user)
Reel.create(item_name: "Twin Power XD", size: "5000", description: "Great", price: "600", item_condition: "good", brand: shim, reel_type: spin, user: second_user)

Reel.create(item_name: "22 Saltiga 15", description: "Great", price: "850", item_condition: "good", brand: dai, reel_type: oh, user: second_user)
Reel.create(item_name: "21 Saltiga IC 300", description: "Great", price: "850", item_condition: "good", brand: dai, reel_type: oh, user: second_user)
Reel.create(item_name: "Saltiga Star Drag Overhead Reel", description: "Great", price: "650", item_condition: "good", brand: dai, reel_type: oh, user: second_user)

Reel.create(item_name: "Ocea Jigger F Custom", description: "Great", price: "700", item_condition: "good", brand: shim, reel_type: oh, user: second_user)
Reel.create(item_name: "Ocea Jigger Conquest Limited", description: "Great", price: "730", item_condition: "good", brand: shim, reel_type: oh, user: second_user)
Reel.create(item_name: "Ocea Jigger Grappler Jigging Reel", description: "Great", price: "400", item_condition: "good", brand: shim, reel_type: oh, user: second_user)



