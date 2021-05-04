# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# =================================================================
# User
# =================================================================
customer = Payjp::Customer.create
user = User.create!(family_name: '木村', given_name: '拓哉', display_name: 'キムタク',email: 'kimutaku@example.com', password: 'password', password_confirmation: 'password', customer_id: customer.id)

# =================================================================
# Shop & Product
# =================================================================
shop = Shop.create!(name: 'リンゴ飴屋', description: 'りんご飴を売ってます。',email: "ringo#{i}@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/ringoame.jpg')), filename: 'ringoame.jpg')
product = Product.create!(shop: shop, name: "#{i}.リンゴ飴", description: '美味しいです', price: 91, price_tax: 100, required_minutes: i % 6)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/ringoame_product.jpg')), filename: 'ringoame_product.jpg')

# =================================================================
# Quiz
# =================================================================
Quiz.create!(description: '正解はどれでしょう？', content1: "#{i}!}", content2: "#{i + 1}!", content3: "#{i + 1}!", answer: N % 3 + 1)
