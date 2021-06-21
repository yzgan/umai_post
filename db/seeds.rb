# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# bulk insert user
(1..100)
  .map { |n| { username: "user_#{n}", password: 'password', created_at: DateTime.current, updated_at: DateTime.current } }
  .tap { |params| User.insert_all params }

# bulk insert Post
(1..200_000)
  .map { |n| { title: "title #{n}", content: "content #{n}", created_at: DateTime.current, updated_at: DateTime.current } }
  .tap { |params| Post.insert_all params }

User.find_each do |user|
  (0..50)
    .map { { ip_address: Faker::Internet.ip_v4_address, user_id: user.id, created_at: DateTime.current, updated_at: DateTime.current } }
    .tap { |params| Login.insert_all params }
end
