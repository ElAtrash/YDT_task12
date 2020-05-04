# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning Database...'
User.delete_all
Subject.delete_all
Role.delete_all

puts 'Creating Roles...'
admin = Role.create!(
  can_read: true,
  can_create: true,
  can_update: true,
  can_delete: true,
  admin: true,
  role_type: 'admin'
)

viewer = Role.create!(
  can_read: true,
  can_create: false,
  can_update: false,
  can_delete: false,
  admin: false,
  role_type: 'viewer'
)

puts 'Creating Users...'
users_attributes = []
10.times do 
  user = {
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6),
    role: viewer
    }

  users_attributes << user
end 

User.create!(users_attributes)

admin_user = User.create!(
  username: 'test_admin',
  email: 'test@example.com',
  password: 123456,
  role: admin
)

puts 'Creating Subjects...'
new_subjects_attributes = []
10.times do 
  new_subject = {
    topic: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.unique.paragraph_by_chars(number: 256, supplemental: false),
    status: 'New'
    }

  new_subjects_attributes << new_subject
end 

Subject.create!(new_subjects_attributes)

old_subjects_attributes = []
10.times do 
  old_subject = {
    topic: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.unique.paragraph_by_chars(number: 256, supplemental: false),
    status: 'Old'
    }

  old_subjects_attributes << old_subject
end 

Subject.create!(old_subjects_attributes)

puts 'Done!'
