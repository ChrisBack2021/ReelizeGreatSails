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


User.create!(email: 'admin@test.com', password: '123321')
Profile.create(first_name: 'Admin', last_name: 'Admin', age: 51, user_id: 1)

Brand.create(brand: "Shimano")
Brand.create(brand: "Daiwa")

ReelType.create(reel_type: "Spinning")
ReelType.create(reel_type: "Overhead")

Reel.create(item_name: "Certate", size: "5000", description: "Great", price: "700", item_condition: "good", brand_id: 2, reel_type_id: 1)
Reel.create(item_name: "Exist", size: "2500", description: "Great", price: "800", item_condition: "good", brand_id: 2, reel_type_id: 1)
Reel.create(item_name: "Saltiga", size: "5000", description: "Great", price: "1200", item_condition: "good", brand_id: 2, reel_type_id: 1)

Reel.create(item_name: "Stella", size: "10000", description: "Great", price: "1100", item_condition: "good", brand_id: 1, reel_type_id: 1)
Reel.create(item_name: "Vanford", size: "3000", description: "Great", price: "250", item_condition: "good", brand_id: 1, reel_type_id: 1)
Reel.create(item_name: "Twin Power XD", size: "5000", description: "Great", price: "600", item_condition: "good", brand_id: 1, reel_type_id: 1)

Reel.create(item_name: "22 Saltiga 15", description: "Great", price: "850", item_condition: "good", brand_id: 2, reel_type_id: 2)
Reel.create(item_name: "21 Saltiga IC 300", description: "Great", price: "850", item_condition: "good", brand_id: 2, reel_type_id: 2)
Reel.create(item_name: "Saltiga Star Drag Overhead Reel", description: "Great", price: "650", item_condition: "good", brand_id: 2, reel_type_id: 2)

Reel.create(item_name: "Ocea Jigger F Custom", description: "Great", price: "700", item_condition: "good", brand_id: 1, reel_type_id: 2)
Reel.create(item_name: "Ocea Jigger Conquest Limited", description: "Great", price: "730", item_condition: "good", brand_id: 1, reel_type_id: 2)
Reel.create(item_name: "Ocea Jigger Grappler Jigging Reel", description: "Great", price: "400", item_condition: "good", brand_id: 1, reel_type_id: 2)




