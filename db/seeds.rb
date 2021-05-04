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
shop = Shop.create!(name: '屋台 東京名物 肉巻きおにぎり', description: '白ゴマ肉巻　/　チーズ肉巻　/　ねぎマヨ肉巻　/　タルタル肉巻　/　黒のり肉巻　/　キムチ肉巻　/　辛マヨ肉巻　全7種',email: "nikumaki@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-shop.png')), filename: 'nikumakionigiri-shop.png')

Product.create!(shop: shop, name: "肉巻きおにぎり 白ゴマ肉巻", description: '1番人気！', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり チーズ肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり ネギマヨ肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり タルタル肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり 黒のり肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり キムチ肉巻", description: '辛いのが苦手なお子様はお控えください。', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

Product.create!(shop: shop, name: "肉巻きおにぎり からマヨ肉巻", description: '辛いのが苦手なお子様はお控えください。', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

# =================================================================
# Quiz
# =================================================================
Quiz.create!(description: '正解はどれでしょう？', content1: "#{i}!}", content2: "#{i + 1}!", content3: "#{i + 1}!", answer: N % 3 + 1)
