# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Setting.create(required_skill_multiplier: 100, preferred_skill_multiplier: 80, desired_skill_multiplier: 50, total_skill_hours: 10000, total_career_hours: 80000, hours_in_a_day: 8)