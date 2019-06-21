# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8


# 投稿カテゴリ



100.times do
  Post.create(
    post_category_id: Faker::Number.within(1..13),
    post_content: '頑張ります',
    user_id: Faker::Number.within(4..5),
    created_at: Faker::Date.between(1.year.ago, Date.today),
    cheer_count: Faker::Number.within(0..50)
      )
end

