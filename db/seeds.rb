# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Chronometer starts !
puts "*** Started at #{Time.now} ***"
puts

# DESTROY SECTION - Uncomment to truncate all SQLite tables + anihilate all created objects + empty tmp tables
puts "[DESTROY SECTION - BEGIN]"
puts "  > Destroying objects and deleting from tables"
City.destroy_all
puts "    - Cities flushed"
User.destroy_all
puts "    - Users flushed"
Gossip.destroy_all
puts "    - Gossips flushed"
Tag.destroy_all
puts "    - Tags flushed"
GossipTag.destroy_all
puts "    - Links between gossips and tags flushed"
Like.destroy_all
puts "    - Likes flushed"
Comment.destroy_all
puts "    - Comments flushed"
PrivateMessage.destroy_all
puts "    - PrivateMessages flushed"
puts "  > All objects destroyed successfully"
puts "[DESTROY SECTION - END]"
puts

# POPULATE SECTION - Notice: order of population may be structuring (cannot load data into 'appointments' before 'doctors' and 'patients' exist ;-)
puts "[POPULATE SECTION - BEGIN]"

# 01 - Populate 'cities'
puts "  > Populating 'cities'"
100.times do
	City.create(city_name: Faker::Address.city, 
              zip_code: Faker::Address.zip)
end
puts "    - Done populating 'cities'"

# 02 - Populate 'users'
puts "  > Populating 'users'"
100.times do
	User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name,
              nickname: Faker::Superhero.name,
              gender: Faker::Demographic.sex,
              birthdate: Faker::Date.between(from: '1978-03-27', to: '2014-07-03'),
              # age: (Date.today.year - self.birthdate.year),
              # is_adult: (self.age>=18), 
              city_id: City.all.sample.id)
end

puts "    - Done populating 'users' (main fields)"

User.all.each do |my_user|
  my_user.age = (Date.today.year - my_user.birthdate.year)
  my_user.is_adult = (my_user.age >= 18)
  my_user.save
end
puts "    - Done populating 'users' age and 'is_adult' boolean switch (computed)"

# 03 - Populates 'my_private_messages'

# 04 - Populate 'my_gossips'

# 05 - Populate 'my_tags'

# 06 - Populate 'my_gossip_tags'

# 07 - Populate 'my_comments'

# 08 - Populate 'my_likes'



puts "[POPULATE SECTION - END]"
puts

# Chronometer stops !
puts "*** Ended at #{Time.now} ***"