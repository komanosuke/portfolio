# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# Admin.create(name: 'fashion', password: 'fashionable')

# User.create(name: 'John Lennon', username: 'John', email: 'user@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', zip: '', prefecture: '', city: '', street: '', address: '', tel: '', profile: '', activated: true)
# User.create(name: 'Monkey.D.Luffy', username: 'Luffy', email: 'luffy@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', zip: '', prefecture: '', city: '', street: '', address: '', tel: '', profile: '', activated: true)
# User.create(name: 'Boa Hancock', username: 'Female Emperor', email: 'snake@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', zip: '', prefecture: '', city: '', street: '', address: '', tel: '', profile: '', activated: true)

# Cart.create(user_id: 1)
# Cart.create(user_id: 2)
# Cart.create(user_id: 3)

# WorkCat.create(name: 'トップス')
# WorkCat.create(name: 'パンツ')
# WorkCat.create(name: 'スカート')
# WorkCat.create(name: 'ワンピース・ドレス')
# WorkCat.create(name: 'サロペット・オールインワン')
# WorkCat.create(name: 'セットアップアイテム')
# WorkCat.create(name: 'アウター')
# WorkCat.create(name: 'バッグ')
# WorkCat.create(name: 'シューズ')
# WorkCat.create(name: '帽子')
# WorkCat.create(name: 'ファッション小物')
# WorkCat.create(name: '財布・小物')
# WorkCat.create(name: 'アクセサリー')
# WorkCat.create(name: 'ヘアアクセサリー')

# Work.create(work_cat_id: 7, title: '「真紅」', price:'259900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 1, status: 1, image:File.open("./public/image/mid_red.png"))
# Work.create(work_cat_id: 7, title: '「群青」', price:'13900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_blue.png"))
# Work.create(work_cat_id: 7, title: '「新緑」', price:'13900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_green.png"))
# Work.create(work_cat_id: 7, title: '「雷鳴」', price:'14900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_yellow.png"))
# Work.create(work_cat_id: 7, title: '「紫蘇」', price:'16900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_purple.png"))
# Work.create(work_cat_id: 7, title: '「山吹」', price:'14900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_orange.png"))
# Work.create(work_cat_id: 7, title: '「桃花」', price:'15900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_pink.png"))
# Work.create(work_cat_id: 7, title: '「漆黒」', price:'10900', text: '素材に〇〇を使い、着心地の良い仕上がりになっています。流行の〇〇スタイルと独自のデザインを織り交ぜ、他の人とは被らない唯一無二のものになっています。', onlyone: 0, status: 1, image:File.open("./public/image/mid_black.png"))

# ArticleCat.create(name: '制作')
# ArticleCat.create(name: 'インスピレーション')

# Article.create(article_cat_id: 2, image:File.open("./public/image/yugami.jpg"), title: '瀬戸大橋から受けたインスピレーションについて語る', image_title: '瀬戸大橋で偶然撮れた一枚', text: '吾輩わがはいは猫である。名前はまだ無い。 どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。 吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。 この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。')
# Article.create(article_cat_id: 2, image:File.open("./public/image/mirror.jpg"), title: '衣服づくりと自然現象について徒然と', image_title: '人気の撮影法「鏡面反射」、ファッションにも活かせないか', text: '吾輩わがはいは猫である。名前はまだ無い。 どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。 吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。 この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。')
# Article.create(article_cat_id: 1, image:File.open("./public/image/monster.png"), title: '「ヤバイ怪物」をテーマに衣服をデザインするまでの工程', image_title: 'AIの描く怪物が面白い', text: '吾輩わがはいは猫である。名前はまだ無い。 どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。 吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。 この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。')
# Article.create(article_cat_id: 2, image:File.open("./public/image/firebird.png"), title: '手塚治虫の名作「火の鳥」を読んで考えたこと', image_title: '幻想的な火の鳥のイメージ', text: '吾輩わがはいは猫である。名前はまだ無い。 どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。 吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。 この書生というのは時々我々を捕つかまえて煮にて食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。')

# Post.create(user_id: 1, image:File.open("./public/image/firebird.png"), content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 1, content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 1, content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 1, image:File.open("./public/image/firebird.png"), content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 2, image:File.open("./public/image/firebird.png"), content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 2, content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 3, content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")
# Post.create(user_id: 3, image:File.open("./public/image/firebird.png"), content: "ユーザーがゲームをプレイするには、Ethereum上でのアカウントが必要です。アカウントを作成し、スマートコントラクトと紐付けることで、トランザクションを送信し、ゲームをプレイすることができます。")

# Comment.create(user_id: 1, post_id: 1, content: 'aaaaaa')
# Like.create(user_id: 1, post_id: 1)

# Relationship.create(follower_id: 1, followed_id: 2)
# Relationship.create(follower_id: 2, followed_id: 1)

# StudyRecord.create(user_id:1,grade1:'00000000000000000000000000000000000000000000000000000000000000000000000000000000',grade2:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade3:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade4:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade5:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade6:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')

# Lifecost.create(user_id:1, twenty:3000000, thirty:4000000, forty:5000000, fifty:6000000, sixty:2000000, marriage:0, child:0, house:0, car:0, care:0, rent:0, utility:0, internet:0, insurance:0, car_cost:0, child_care:0, lesson:0, transport:0, pocket_money:0, other_cost:0, food:0, necessity:0, medical_cost:0, child_lesson:0, clothes:0, beauty:0, companionship:0, entertainment:0, small_cost:0, exception:0, marriage_total:5130000, child_total:9860000, house_total: 32740000, car_total:15000000, tax:20, pension:0)

