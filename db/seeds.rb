# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.where(username: 'admin')
  .first_or_create(username: 'admin', email: 'admin@zoeoberon.com', role: 'admin',
                   password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.where(username: 'molly')
  .first_or_create(username: 'molly', email: 'molly@zoeoberon.com', role: 'manager',
                   password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.where(username: 'fred')
  .first_or_create(username: 'fred', email: 'fred@zoeoberon.com', role: 'user',
                   password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.where(username: 'guest')
  .first_or_create(username: 'guest', email: 'guest@zoeoberon.com', role: 'guest',
                   password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.where(username: 'jane')
  .first_or_create(username: 'jane', email: 'jane@zoeoberon.com', role: 'user',
                   password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
