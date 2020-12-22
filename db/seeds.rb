# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'ad@1',
              password: 'password')

Customer.create!(email: 'cus@1',
                 password: 'password',
                 family_name: 'Sample_fam1',
                 first_name: 'Sample_fir1',
                 family_kana: 'Sample_famka1',
                 first_kana: 'Sample_firka1',
                 postal_code: '1234567',
                 address: 'Sampleaddress1',
                 tel: '12345678901')

Customer.create!(email: 'cus@2',
                 password: 'password',
                 family_name: 'Sample_fam2',
                 first_name: 'Sample_fir2',
                 family_kana: 'Sample_famka2',
                 first_kana: 'Sample_firka2',
                 postal_code: '1234567',
                 address: 'Sampleaddress2',
                 tel: '12345678901',
                 is_deleted: true)

Genre.create!(type: 'ケーキ',
              is_active: true)
Genre.create!(type: '焼き菓子',
              is_active: true)
Genre.create!(type: 'プリン',
              is_active: true)
Genre.create!(type: 'キャンディ')

Product.create!(genre_id: '1',
                name: 'ケーキ',
                body: 'ケーキの説明',
                tax_out_price: '120'
                )

Product.create!(genre_id: '2',
                name: 'チョコクッキー',
                body: 'チョコクッキーの説明',
                tax_out_price: '80'
                )

Product.create!(genre_id: '3',
                name: 'マンゴープリン',
                body: 'マンゴープリンの説明',
                tax_out_price: '180',
                )

Product.create!(genre_id: '4',
                name: 'さくらんぼあめ',
                body: 'さくらんぼあめの説明',
                tax_out_price: '90',
                )

Product.create!(genre_id: '1',
                name: '高級ケーキ',
                body: '高級ケーキの説明',
                tax_out_price: '2000',
                created_at: "12 Dec 2020 16:07:43"
                )


Order.create!(customer_id: '1',
              postal_code: '2560094',
              address: 'america',
              name: 'pikuru',
              shipping: '800',
              payment: 1,
              sum: '11000',
              status: 0,
              created_at: '12 Dec 2020 16:39:49',
              updated_at: '12 Dec 2020 16:43:35'
              )

OrderProduct.create!(product_id: '1',
                     order_id: '1',
                     quantity: '20',
                     tax_in_price: '11000',
                     status: 0,
                     created_at: '12 Dec 2020 17:07:47',
                     updated_at: '12 Dec 2020 19:19:23'
                    )


Order.create!(customer_id: '1',
              postal_code: '2560094',
              address: 'america',
              name: 'pikuru',
              shipping: '800',
              payment: 1,
              sum: '11000',
              status: 0,
              )

OrderProduct.create!(product_id: '1',
                     order_id: '2',
                     quantity: '50',
                     tax_in_price: '11000',
                     status: 0,
                     )