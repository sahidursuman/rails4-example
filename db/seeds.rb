# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.find_or_create_by_username(username: 'admin', email: 'admin@zoeoberon.com', role: 'admin',
                                password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.find_or_create_by_username(username: 'molly', email: 'molly@zoeoberon.com', role: 'manager',
                                password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.find_or_create_by_username(username: 'fred', email: 'fred@zoeoberon.com', role: 'user',
                                password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.find_or_create_by_username(username: 'guest', email: 'guest@zoeoberon.com', role: 'guest',
                                password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
User.find_or_create_by_username(username: 'jane', email: 'jane@zoeoberon.com', role: 'user',
                                password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
