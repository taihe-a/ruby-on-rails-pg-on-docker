# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == "development" || "test"
    (1..10).each do |i|
    Task.create(
        name: "タスク#{i}", 
        detail: "タスク詳細表示タスク詳細表示#{i}", 
        deadline: Faker::Date.between(from: 1.month.ago, to: Date.today),
        progress: Faker::Number.between(from: 1, to: 3)
    )
    end
end