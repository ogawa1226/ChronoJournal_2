# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "テスト",
  email: "test@test.com",
  password: "123456"
)
puts "ユーザーを作成"


categories = [
  "おでかけ",
  "記念日",
  "仕事",
  "病院",
  "美容",
  "趣味",
  "旅行"
]

categories.each do |category|
  Category.create!(name: category)
  puts "カテゴリー『#{category}』を作成"
end



# 3.times do |n|
#   Schedule.create!(
#     category_id: 1,
#     title: "タイトル#{n + 1}",
#     start_time: "12:00#{n + 1}",
#     end_time: "13:00#{n + 1}"
#   )
#   puts "スケジュール#{n + 1}を作成"
#   Refkection.create!(
#     schedule_id: 1,
#     title: "振り返りタイトル"
#     content: "内容"
#   )
#   
# end
# puts "スケジュール全作成"


