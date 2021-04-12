# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Stock.create(companyName: 'testStock')
User.create(username: 'Matt', password: '123')
Watchlist.create(user_id: 1, name: 'default')
# WatchStock.create(watchlist_id: 1, stock_id: 1)
Comment.create(user_id: 1, watchlist_id: 1, body: 'Wow it really works')