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

product = Product.create!(shop: shop, name: "肉巻きおにぎり 白ゴマ肉巻", description: '1番人気！', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり チーズ肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり ネギマヨ肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり タルタル肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり 黒のり肉巻", description: '', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり キムチ肉巻", description: '辛いのが苦手なお子様はお控えください。', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')

product = Product.create!(shop: shop, name: "肉巻きおにぎり からマヨ肉巻", description: '辛いのが苦手なお子様はお控えください。', price: 91, price_tax: 350, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/nikumakionigiri-product.png')), filename: 'nikumakionigiri-prodct.png')


shop = Shop.create!(name: '屋台 街の風物詩 たこ焼き', description: '大阪出身の店主が「本場のたこ焼き」を提供！大きいタコに濃ゆ～いソースで旨いこと間違いなし！是非にご賞味あれ！',email: "takoyaki@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-shop.png')), filename: 'takoyaki-shop.png')

product = Product.create!(shop: shop, name: "たこ焼き ソース味", description: '定番のソース味！大人から子供までもが好きな味', price: 371, price_tax: 400, required_minutes: 3)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-product2.jpeg')), filename: 'takoyaki-prodct2.jpeg')

product = Product.create!(shop: shop, name: "たこ焼き ソース味", description: '定番のソース味！大人から子供までもが好きな味', price: 371, price_tax: 400, required_minutes: 5)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-product2.jpeg')), filename: 'takoyaki-prodct2.jpeg')

product = Product.create!(shop: shop, name: "たこ焼き ポン酢味", description: 'あっさり美味しいポン酢！女性や子供に人気です', price: 371, price_tax: 400, required_minutes: 5)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-product.jpeg')), filename: 'takoyaki-prodct.jpeg')

shop = Shop.create!(name: '屋台 定番 チョコバナナ', description: 'バナナ全体にチョコレートが絡められ、粒上のチョコレートでデコレーションされています。お祭りで食べ歩きをするのであれば、うってつけのデザートです。',email: "tyokobanana@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/tyokobanana-shop.png')), filename: 'tyokobanana-shop.png')

product = Product.create!(shop: shop, name: "チョコバナナ", description: '', price: 180, price_tax: 200, required_minutes: 0)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/tyokobanana-product.jpeg')), filename: 'tyokobanana-prodct.jpeg')
# =================================================================
# Quiz
# =================================================================
#Quiz.create!(description: '正解はどれでしょう？', content1: "#{i}!}", content2: "#{i + 1}!", content3: "#{i + 1}!", answer: N % 3 + 1)
