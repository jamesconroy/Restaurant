# GEMS
require 'bundler/setup'
Bundler.require

# CONNECTION
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant'
)

# MODELS
require './models/party'
require './models/food'
require './models/order'
require './models/user'

namespace :db do

  desc "Create Admin User"
  task :create_user do
    user = User.new({username: 'admin'})
    user.password='admin'
    user.save!
  end

  desc 'Fill Database with Junk Data'
  task :junk_data do

    # GENERATE RANDOM FOOD
    foods_starting = ['Chicken', 'Veggie', 'Beef', 'Rice']
    food_ending = ['Salad', 'Soup', 'Plate', 'Bowl']
    cuisines = ['Lite', "Homecooking", 'Party', 'Bar Food']
    rand(5..15).times do
      Food.create({
        name: (foods_starting.sample + ' ' + food_ending.sample),
        cents: rand(500..1500),
        cusine: cuisines.sample
      })
    end

    # GENERATE RANDOM PARTIES
    rand(5..15).times do |num|
      Party.create({
        table_number: num,
        is_paid: [true, false, false].sample
        })
    end

    # GENERATE RANDOM ORDERS
    parties = Party.all
    foods = Food.all
    rand(10..35).times do |num|
      Order.create({
        party: parties.sample,
        food: foods.sample
        })
    end

  end

  desc 'Empty Database'
  task :empty do
    Order.destroy_all
    Food.destroy_all
    Party.destroy_all
  end #task :empty

end # namespace :db
