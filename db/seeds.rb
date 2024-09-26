# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: "admin@admin") do |admin|
   admin.password = 'testtest'
end

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
   admin.password = 'password'
end



User.find_or_create_by!(email: "aaa@aaa") do |user|
  user.name = "ayama ako"
  user.nickname = "aaa"
  user.password = "abcd123"
end

User.find_or_create_by!(email: "bbb@bbb") do |user|
  user.name = "byama bko"
  user.nickname = "bb"
  user.password = "abcd123"
end