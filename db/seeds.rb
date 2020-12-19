# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@email',
              password: 'password')

Customer.create!(email: 'customer@email',
                 password: 'password',
                 family_name: 'sample',
                 first_name: 'customer',
                 family_kana: 'samplekana',
                 first_kana: 'customerkana',
                 postal_code: '1234567',
                 address: 'sampleaddress',
                 tel: '12345678901')

Genre.create!(type: '菓子')

Product.create!(genre_id: '1',
                name: 'ケーキ',
                body: 'ケーキの説明',
                tax_out_price: '120',
                )