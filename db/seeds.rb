# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
SystemAdmin.create!(name: 'システムテスト太郎', email: 'system_test@example.com', password: 'password', password_confirmation: 'password')

customer1 = Payjp::Customer.create
customer2 = Payjp::Customer.create
user = User.create!(family_name: 'システム', given_name: 'テスト太郎1', display_name: '太郎1',email: 'test1@example.com', password: 'password', password_confirmation: 'password', customer_id: customer1.id)
User.create!(family_name: 'システム', given_name: 'テスト太郎2', display_name: '太郎2',email: 'test2@example.com', password: 'password', password_confirmation: 'password', customer_id: customer2.id)

40.times do
  shop = Shop.create!(name: 'リンゴ飴屋', description: 'りんご飴を売ってます。',email: 'ringo@example.com', password: 'password', password_confirmation: 'password')
  shop.image.attach(io: File.open(Rails.root.join('app/assets/images/ringoame.jpg')), filename: 'ringoame.jpg')
  2.times do |i|
    Product.create!(shop: shop, name: "#{i}.リンゴ飴", description: '美味しいです', price: 91, price_tax: 100, required_minutes: i % 6)
  end
end

shop1 = Shop.find(1)

Coupon.create!(name: '割引クーポンA', discount: 10, user: user, expired_at: Time.current.end_of_day, shop: shop1)
Coupon.create!(name: '割引クーポンB', discount: 20, user: user, expired_at: Time.current.end_of_day, shop: shop1)
Coupon.create!(name: '割引クーポンC', discount: 30, user: user, expired_at: Time.current.end_of_day, shop: shop1)
Coupon.create!(name: '割引クーポンD', discount: 40, user: user, expired_at: Time.current.end_of_day, shop: shop1)
Coupon.create!(name: '割引クーポンE', discount: 50, user: user, expired_at: Time.current.end_of_day, shop: shop1)

N = 20
N.times do |i|
  Quiz.create!(description: '正解はどれでしょう？', content1: "#{i}!}", content2: "#{i + 1}!", content3: "#{i + 1}!", answer: N % 3 + 1)
  GameTicket.create!(user: user, expired_at: Time.current.end_of_day, shop: shop1, product: shop1.products.find(1))
end
