# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
User.destroy_all

rachelgonzales = User.create(username: "rg", email: "rachelgonzales@gmail.com", password: "123456")
rachelgonza = User.create(username: "rrg", email: "rachelgonza@gmail.com", password: "1234567")
rachelgonzales.posts.create(title: "first Blog", description: "i love blogging", user_id: rachelgonzales.id)
rachelgonza.posts.create(title: "second blog", description: "second blog", user_id: rachelgonza.id)