# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Note: All administrators are also helpers
User.find_or_create_by_uid_and_provider(name: "Ed Roman", provider: "facebook", uid: "1530982589", email: "edward.w.roman@gmail.com", member: "administrators")
