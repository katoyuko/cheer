# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8


# 投稿カテゴリ

require "csv"

CSV.foreach('db/category.csv', headers: true) do |row|
  PostCategory.create(category: row["category"])
end


100.times do
  Post.create(
    post_category_id: Faker::Number.within(1..12),
    post_content: '頑張ります',
    user_id: Faker::Number.within(1..50),
    created_at: Faker::Date.between(1.year.ago, Date.today),
    cheer_count: Faker::Number.within(0..50)
      )
end


50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password
               )
end


50.times do
  PostComment.create(
    comment: '応援してます',
    user_id: Faker::Number.within(1..50),
    post_id: Faker::Number.within(1..100)
      )
end


4.times do
  FavoriteCategory.create(
    post_category_id: Faker::Number.within(1..12),
    user_id: Faker::Number.within(1..50)
      )
end