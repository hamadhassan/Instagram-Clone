# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Account.create([
                 { username: 'john', full_name: 'John Doe', email: 'johndoe@example.com',
                   password: 'password' },
                 { username: 'jane', first_name: 'Jane Smith', email: 'janesmith@example.com',
                   password: 'password' },
                 { username: 'susan', first_name: 'Susan Bajer', email: 'susanbaker@example.com',
                   password: 'password' },
                 { username: 'hamad', first_name: 'Hammad Hassan', email: 'hamad@gmail.com',
                   password: '123456' }
                   { username: 'ahmed', first_name: 'Ahmed Hassan', email: 'abc@gmail.com',
                    password: '123456' }
               ])
