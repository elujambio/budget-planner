# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

API_TEST_USER = User.create({ name: "Pablo", email: "eugenio@nuva.rocks", password: "qwerty123", password_confirmation: "qwerty123", api_key: "PsmmvKBqQDOaWwEsPpOCYMsy" })

API_TEST_BUDGETS = Budget.create([{ name: "Japón", total: "100000", user: API_TEST_USER }, { name: "Alemania", total: "20000", user: API_TEST_USER }, { name: "Praga", total: "10", user: API_TEST_USER }]) 