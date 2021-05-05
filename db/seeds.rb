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

product = Product.create!(shop: shop, name: "たこ焼き ソース味", description: '定番のソース味！大人から子供までもが好きな味', price: 371, price_tax: 400, required_minutes: 5)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-product2.jpeg')), filename: 'takoyaki-prodct2.jpeg')

product = Product.create!(shop: shop, name: "たこ焼き ポン酢味", description: 'あっさり美味しいポン酢！女性や子供に人気です', price: 371, price_tax: 400, required_minutes: 5)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/takoyaki-product.jpeg')), filename: 'takoyaki-prodct.jpeg')


shop = Shop.create!(name: '屋台 定番 チョコバナナ', description: 'バナナ全体にチョコレートが絡められ、粒上のチョコレートでデコレーションされています。お祭りで食べ歩きをするのであれば、うってつけのデザートです。',email: "tyokobanana@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/tyokobanana-shop.png')), filename: 'tyokobanana-shop.png')

product = Product.create!(shop: shop, name: "チョコバナナ", description: '', price: 180, price_tax: 200, required_minutes: 0)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/tyokobanana-product.jpeg')), filename: 'tyokobanana-prodct.jpeg')


shop = Shop.create!(name: '焼き鳥', description: '焼き鳥はいかがですか？身の引き締まった地鶏からと高火力の炭火焼で味もよし！匂いもよし！自慢の一品をこの機会にご賞味ください！',email: "yakitori@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/yakitori-shop.png')), filename: 'yakitori-shop.png')

product = Product.create!(shop: shop, name: "焼き鳥　ねぎま", description: '自慢の地鶏と甘いネギの相性抜群！', price: 180, price_tax: 200, required_minutes: 2)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/yakitori-product1.jpg')), filename: 'yakitori-product1.jpg')

product = Product.create!(shop: shop, name: "焼き鳥　ももタレ", description: 'ジューシー！自信の一品です！', price: 180, price_tax: 200, required_minutes: 2)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/yakitori-product2.jpg')), filename: 'yakitori-product2.jpg')

product = Product.create!(shop: shop, name: "焼き鳥　かわ", description: '好きな人は好き！', price: 180, price_tax: 200, required_minutes: 2)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/yakitori-product3.jpg')), filename: 'yakitori-product3.jpg')


shop = Shop.create!(name: 'ベビーカステラ', description: 'お祭りの定番「ベビーカステラ」！大・中・小の三種類からお選びください',email: "babyc@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/babyc-shop.jpeg')), filename: 'babyc-shop.jpeg')

product = Product.create!(shop: shop, name: "ベビーカステラ大", description: 'お得な大容量！', price: 450, price_tax: 500, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/babyc-product.jpeg')), filename: 'babyc-product.jpeg')

product = Product.create!(shop: shop, name: "ベビーカステラ中", description: 'お祭りのお供に！', price: 371, price_tax: 400, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/babyc-product.jpeg')), filename: 'babyc-product.jpeg')

product = Product.create!(shop: shop, name: "ベビーカステラ小", description: 'あなたの小腹を満たします', price: 180, price_tax: 200, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/babyc-product.jpeg')), filename: 'babyc-product.jpeg')


shop = Shop.create!(name: 'かき氷', description: '蒸し暑い日本の夏に欠かせないかき氷！今年も富士山で採れる天然水を使って製氷しています！',email: "ice@example.com", password: 'password', password_confirmation: 'password')
shop.image.attach(io: File.open(Rails.root.join('app/assets/images/ice-shop.jpeg')), filename: 'ice-shop.jpeg')

product = Product.create!(shop: shop, name: "かき氷（いちご）", description: '夏だからこそ食べたいいちこ味', price: 180, price_tax: 200, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/ice-product1.jpeg')), filename: 'ice-product1.jpeg')

product = Product.create!(shop: shop, name: "かき氷（抹茶）", description: '京都直送の抹茶をふんだんに使った抹茶味', price: 180, price_tax: 200, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/ice-product2.jpeg')), filename: 'ice-product2.jpeg')

product = Product.create!(shop: shop, name: "かき氷（ブルーハワイ）", description: 'みんな大好きブルーハワイ味', price: 180, price_tax: 200, required_minutes: 1)
product.image.attach(io: File.open(Rails.root.join('app/assets/images/ice-product3.jpeg')), filename: 'ice-product3.jpeg')

# =================================================================
# Quiz
# =================================================================
Quiz.create!(description: '今回のお祭りの名前は何でしょう？', content1: "大開発祭り", content2: "大海賊祭り", content3: "大龍珠祭り", answer: 1)
Quiz.create!(description: '今回の会場はどこでしょう？', content1: "一門公園", content2: "二門公園", content3: "三門公園", answer: 2)
Quiz.create!(description: '今回のお祭りの前夜祭にて企画された催しは次のうちどれでしょう？', content1: "ワードウルフ", content2: "雪山人狼", content3: "Amoung Us", answer: 3)
Quiz.create!(description: '今回のお祭りのゲストは誰でしょう？', content1: "ワタリ119", content2: "ノボせもん なべ", content3: "ゴリけん", answer: 1)
Quiz.create!(description: '今回のお祭りではいくつぐらいの屋台が出店しているでしょう？', content1: "20", content2: "50", content3: "100", answer: 2)
Quiz.create!(description: '前回のお祭りではどのぐらいの人数の人が集まったでしょう？', content1: "1000", content2: "2500", content3: "5000", answer: 3)
Quiz.create!(description: '今回のお祭りはいつから続いているでしょう？', content1: "128年前", content2: "64年前", content3: "16年前", answer: 1)
Quiz.create!(description: '今回のお祭りで行われるモンスターエナジー大飲み大会の優勝賞品はなんでしょう？', content1: "PlayStation 5", content2: "Oculus Quest 2", content3: "ドリームキャスト", answer: 2)
Quiz.create!(description: '今回のお祭りを主催している商店街にはいくつお店があるでしょう？', content1: "30", content2: "50", content3: "80", answer: 3)
Quiz.create!(description: '今回のお祭りを主催している商店街のマスコットキャラクターと言えばなんでしょう？', content1: "ニセエもん", content2: "サカナさん", content3: "ワンパクマン", answer: 3)