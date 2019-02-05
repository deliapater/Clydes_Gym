require_relative( "../models/Member.rb" )
require_relative( "../models/GymClass.rb" )
require_relative( "../models/Booking.rb" )
require("pry")

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()

member1 = Member.new({
  "first_name" => "Juan",
  "last_name" => "Molero",
  "age" => 27,
  "premium_membership" => true
})
member1.save

member2 = Member.new({
  "first_name" => "Nathaly",
  "last_name" => "Paternina",
  "age" => 21,
  "premium_membership" => true
})
member2.save

member3 = Member.new({
  "first_name" => "Cleyra",
  "last_name" => "Uzcategui",
  "age" => 28,
  "premium_membership" => false
})
member3.save

member4 = Member.new({
  "first_name" => "Paola",
  "last_name" => "Aguilar",
  "age" => 31,
  "premium_membership" => false
})
member4.save

gym_class1 = GymClass.new({
  "title" => "Spinning",
  "capacity" => 20,
  "time" => "08:00",
  "date_class" => "Monday",
  "premium_class" => true
})
gym_class1.save

gym_class2 = GymClass.new({
  "title" => "Yoga",
  "capacity" => 20,
  "time" => "20:00",
  "date_class" => "Tuesday",
  "premium_class" => true
})
gym_class2.save

gym_class3 = GymClass.new({
  "title" => "HIT",
  "capacity" => 25,
  "time" => "16:00",
  "date_class" => "Thursday",
  "premium_class" => false
})
gym_class3.save

gym_class4 = GymClass.new({
  "title" => "CrossFit",
  "capacity" => 0,
  "time" => "07:00",
  "date_class" => "Friday",
  "premium_class" => true
})
gym_class4.save

booking1 = Booking.new({
  "member_id" => member1.id,
  "gym_class_id" => gym_class4.id
})
booking1.save

booking2 = Booking.new({
  "member_id" => member2.id,
  "gym_class_id" => gym_class3.id
})
booking2.save

booking3 = Booking.new({
  "member_id" => member3.id,
  "gym_class_id" => gym_class2.id
})
booking3.save

booking4 = Booking.new({
  "member_id" => member4.id,
  "gym_class_id" => gym_class2.id
})
booking4.save

binding.pry
nil
