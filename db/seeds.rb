# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#50.times do |i|
#    Task.find_or_create_by(
#      titre: "Task#{i+1}",
#      content: "Content#{i*10}",
#      deadline_on: Date.today.since(30),
#    priority: [0, 1, 2].sample,
#    status: [0, 1, 2].sample
#    )
#end
general_user = User.create!(
  name: "user",
  email: "general@user.com",
  password: "password",
  password_confirmation: "password",
  admin: false,
)

admin_user = User.create!(
  name: "admin",
  email: "admin@user.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
)

Task.create!(
  title: 'first_task',
  content: 'cook rice',
  deadline_on: Date.today,
  priority: 'high',
  status: 'done',
  user_id: general_user.id,
)

Task.create!(
  title: 'second_task',
  content: 'buy dried plums',
  deadline_on: Date.today.since(1.day),
  priority: 'middle',
  status: 'doing',
  user_id: general_user.id,
)

Task.create!(
  title: 'third_task',
  content: 'make onigiri (rice ball)',
  deadline_on: Date.today.since(2.day),
  priority: 'low',
  status: 'todo',
  user_id: general_user.id,
)

50.times do |i|
  Task.find_or_create_by!(
    title: "Task#{i+1}",
    content: "content#{i*100}",
    deadline_on: Date.today.since(3.day),
    priority: 'low',
    status: 'todo',
    user_id: general_user.id,
  )
end

50.times do |i|
  Task.find_or_create_by!(
    title: "AdminTask#{i+1}",
    content: "スクワット#{i*100}回",
    deadline_on: Date.today.since(3.day),
    priority: 'low',
    status: 'todo',
    user_id: admin_user.id,
  )
end

