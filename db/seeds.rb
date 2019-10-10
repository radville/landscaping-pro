# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
l1 = Landscaper.create!(email: "happymowers@gmail.com", password: "akjhhdkjhf", business_name: "Sarah's Happy Mowers", owner_name: "Sarah McMurdo", description: "We love mowing lawns!", zip_code: "01962")
l2 = Landscaper.create!(email: "landscape@gmail.com", password: "08fgjkhjshdkfs", business_name: "Restful Landscaping", owner_name: "Richard", description: "Providing complete landscaping services", zip_code: "22034")
l3 = Landscaper.create!(email: "springfielder@gmail.com", password: "08fgjkhjshdkfs", business_name: "Springfield Lawn Care", owner_name: "Henry Smith", zip_code: "55867")

u1 = User.create!(first_name: "Bill", last_name: "Weissman", address_1: "68 Pine Street", address_2: "Apt. 3B", city: "New Carrolton", state: "NV", zip_code: "66044", email: "billw@hotmail.com", password: "0198jhjfdhf")
u2 = User.create!(first_name: "Sandra", last_name: "Johnson", address_1: "12 Maple Way", address_2: "#3908", city: "Fryeburg", state: "ME", zip_code: "01774", email: "sandra_johnson@gmail.com", password: "0hhjhjfdhf")
u3 = User.create!(last_name: "Radcliff", address_1: "132 Main St.", city: "West Blueberry", state: "MA", zip_code: "01985", email: "radz@gmail.com", password: "0hhjhjfdhf")

a1 = Appointment.create!(datetime: DateTime.now, frequency: "weekly", price: 50, landscaper: l1, user: u1)
a2 = Appointment.create!(datetime: DateTime.now, frequency: "weekly", price: 50, landscaper: l1, user: u2)
a3 = Appointment.create!(datetime: DateTime.now, price: 95, landscaper: l2, user: u1)
a4 = Appointment.create!(datetime: DateTime.now, frequency: "monthly", price: 150, landscaper: l3, user: u1)
a5 = Appointment.create!(datetime: DateTime.now, price: 25, landscaper: l3, user: u3)

t1 = Service.create!(description: "Mowing")
t2 = Service.create!(description: "Fall Clean Up")
t3 = Service.create!(description: "Spring Clean Up")
t4 = Service.create!(description: "Landscaping")
t5 = Service.create!(description: "Raking")
t6 = Service.create!(description: "Hedge Trimming")
l1.services << t1