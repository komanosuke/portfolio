const quiz = [
	{
		pronunciation:[['イチ','イツ'],['ひと','ひと(つ)']],
		question:['一年','(とくべつなよみかた)一人','一つ'],
		kanji:['一年','一人','一'],
		answer:['いちねん','ひとり','ひと'],
        char_name:'イチバンボシ'
	},
	{
		pronunciation:[['ウ','ユウ'],['みぎ']],
		question:['左右','右足'],
		kanji:['左右','右足'],
		answer:['さゆう','みぎあし'],
        char_name:'ウダイジン'
	},
	{
		pronunciation:[['ウ'],['あめ','あま']],
		question:['雨水','雨天','大雨','(とくべつなよみかた)小雨'],
		kanji:['雨水','雨天','大雨','小雨'],
		answer:['あまみず','うてん','おおあめ','こさめ'],
        char_name:'アメタロー'
	},
	{
		pronunciation:[['エン'],['まる(い)']],
		question:['五円'],
		kanji:['五円'],
		answer:['ごえん'],
        char_name:'五円のゴエモン'
	},
	{
		pronunciation:[['オウ'],['-']],
		question:['王子','王手','女王'],
		kanji:['王子','王手','女王'],
		answer:['おうじ','おうて','じょおう'],
        char_name:'ケイ王'
	},
	{
		pronunciation:[['オン','イン'],['おと','ね']],
		question:['足音','本音','音がく'],
		kanji:['足音','本音','音'],
		answer:['あしおと','ほんね','おん'],
        char_name:'オンプー'
	},
	{
		pronunciation:[['カ','ゲ'],['した','しも','もと','さ(げる)','さ(がる)','くだ(る)','くだ(す)','くだ(さる)','お(ろす)','お(りる)']],
		question:['下がる','さかを下る','下ろす','風下','下校','下山','下車','下水','下見','上下','手下','天下','左下','(とくべつなよみかた)下手','右下','目下'],
		kanji:['下','下','下','風下','下校','下山','下車','下水','下見','上下','手下','天下','左下','下手','右下','目下'],
		answer:['さ','くだ','お','かざしも','げこう','げざん','げしゃ','げすい','したみ','じょうげ','てした','てんか','ひだりした','へた','みぎした','めした'],
        char_name:'サガール'
	},
	{
		pronunciation:[['カ'],['ひ']],
		question:['火気','火山','火力','出火','火花'],
		kanji:['火気','火山','火力','出火','火花'],
		answer:['かき','かざん','かりょく','しゅっか','ひばな'],
        char_name:'ひーちゃん'
	},
	{
		pronunciation:[['カ'],['はな']],
		question:['草花','花見','火花','花びん'],
		kanji:['草花','花見','火花','花'],
		answer:['くさばな','はなみ','ひばな','か'],
        char_name:'花のハンナ'
	},
	{
		pronunciation:[['-'],['かい']],
		question:['赤貝','貝がら'],
		kanji:['赤貝','貝'],
		answer:['あかがい','かい'],
        char_name:'カイジロー'
	},
	{
		pronunciation:[['ガク'],['まな(ぶ)']],
		question:['学ぶ','学生','学年','学力','学校','休学','見学','大学','入学','文学'],
		kanji:['学','学生','学年','学力','学校','休学','見学','大学','入学','文学'],
		answer:['まな','がくせい','がくねん','がくりょく','がっこう','きゅうがく','けんがく','だいがく','にゅうがく','ぶんがく'],
        char_name:'マナブ'
	},
	{
		pronunciation:[['キ','ケ'],['-']],
		question:['火気','気力','空気','正気','天気','人気','本気'],
		kanji:['火気','気力','空気','正気','天気','人気','本気'],
		answer:['かき','きりょく','くうき','しょうき','てんき','にんき','ほんき'],
        char_name:'ヤルキモンキー'
	},
	{
		pronunciation:[['キュウ','ク'],['ここの','ここの(つ)']],
		question:['九日','九つ','九才'],
		kanji:['九日','九','九才'],
		answer:['ここのか','ここの','きゅうさい'],
        char_name:'キュウビノキツネ'
	},
	{
		pronunciation:[['キュウ'],['やす(む)','やす(まる)','やす(める)']],
		question:['休む','休学','休校','休日'],
		kanji:['休','休学','休校','休日'],
		answer:['やす','きゅうがく','きゅうこう','きゅうじつ'],
        char_name:'オヤスミコアラ'
	},
	{
		pronunciation:[['ギョク'],['たま']],
		question:['白玉','玉子','水玉','目玉'],
		kanji:['白玉','玉子','水玉','目玉'],
		answer:['しらたま','たまご','みずたま','めだま'],
        char_name:'玉やボウヤ'
	},
	{
		pronunciation:[['キン','コン'],['かね','かな']],
		question:['金曜','引金','金づち','(とくべつなよみかた)黄金'],
		kanji:['金曜','引金','金','黄金'],
		answer:['きんよう','ひきがね','かな','おうごん'],
        char_name:'金のダイブツ'
	},
	{
		pronunciation:[['クウ'],['そら','あ(く)','あ(ける)','から']],
		question:['青空','大空','空手','空気','空中','空白','上空','天空'],
		kanji:['青空','大空','空手','空気','空中','空白','上空','天空'],
		answer:['あおぞら','おおぞら','からて','くうき','くうちゅう','くうはく','じょうくう','てんくう'],
        char_name:'ソラ'
	},
	{
		pronunciation:[['ゲツ','ガツ'],['つき']],
		question:['正月','先月','月日','月見','年月'],
		kanji:['正月','先月','月日','月見','年月'],
		answer:['しょうがつ','せんげつ','つきひ','つきみ','ねんげつ'],
        char_name:'ムーン'
	},
	{
		pronunciation:[['ケン'],['いぬ']],
		question:['犬かき','名犬'],
		kanji:['犬','名犬'],
		answer:['いぬ','めいけん'],
        char_name:'サムライ犬'
	},
	{
		pronunciation:[['ケン'],['み(る)','み(える)','み(せる)']],
		question:['見学','下見','立見','月見','花見','見本'],
		kanji:['見学','下見','立見','月見','花見','見本'],
		answer:['けんがく','したみ','たちみ','つきみ','はなみ','みほん'],
        char_name:'ミルメ'
	},
	{
		pronunciation:[['ゴ'],['いつ','いつ(つ)']],
		question:['五日','五つ','五才'],
		kanji:['五日','五','五才'],
		answer:['いつか','いつ','ごさい'],
        char_name:'イツツボシ'
	},
	{
		pronunciation:[['コウ','ク'],['くち']],
		question:['糸口','入口','大口','人口','手口','出口','早口','一口'],
		kanji:['糸口','入口','大口','人口','手口','出口','早口','一口'],
		answer:['いとぐち','いりぐち','おおくち','じんこう','てぐち','でぐち','はやくち','ひとくち'],
        char_name:'ヒトクチ'
	},
	{
		pronunciation:[['コウ'],['-']],
		question:['学校','休校','下校','本校'],
		kanji:['学校','休校','下校','本校'],
		answer:['がっこう','きゅうこう','げこう','ほんこう'],
        char_name:'校しゃのすけ'
	},
	{
		pronunciation:[['サ'],['ひだり']],
		question:['左右','左足','左上','左下','左手','左目'],
		kanji:['左右','左足','左上','左下','左手','左目'],
		answer:['さゆう','ひだりあし','ひだりうえ','ひだりした','ひだりて','ひだりめ'],
        char_name:'サダイジン'
	},
	{
		pronunciation:[['サン'],['み','みつ','みっ(つ)']],
		question:['三人','三日','三日月'],
		kanji:['三人','三日','三日月'],
		answer:['さんにん','みっか','みかづき'],
        char_name:'ミカヅキング'
	},
	{
		pronunciation:[['サン'],['やま']],
		question:['火山','下山','山林'],
		kanji:['火山','下山','山林'],
		answer:['かざん','げざん','さんりん'],
        char_name:'マウント'
	},
	{
		pronunciation:[['シ','ス'],['こ']],
		question:['赤子','王子','白子','女子','玉子','男子'],
		kanji:['赤子','王子','白子','女子','玉子','男子'],
		answer:['あかご','おうじ','しらこ','じょし','たまご','だんし'],
        char_name:'コ子'
	},
	{
		pronunciation:[['シ'],['よ','よつ','よっ(つ)','よん']],
		question:['四日','四月','四才'],
		kanji:['四日','四月','四才'],
		answer:['よっか','しがつ','よんさい'],
        char_name:'シカクガリ'
	},
	{
		pronunciation:[['シ'],['いと']],
		question:['糸口'],
		kanji:['糸口'],
		answer:['いとぐち'],
        char_name:'イトオカシ'
	},
	{
		pronunciation:[['ジ'],['あざ']],
		question:['赤字','一字','十字','名字','文字'],
		kanji:['赤字','一字','十字','名字','文字'],
		answer:['あかじ','いちじ','じゅうじ','みょうじ','もじ'],
        char_name:'字じい'
	},
	{
		pronunciation:[['ジ'],['みみ']],
		question:['右耳','耳鼻科'],
		kanji:['右耳','耳鼻科'],
		answer:['みぎみみ','じびか'],
        char_name:'ミミゾウ'
	},
	{
		pronunciation:[['シチ'],['なな','なな(つ)','なの']],
		question:['(とくべつなよみかた)七夕','七日','七才'],
		kanji:['七夕','七日','七才'],
		answer:['たなばた','なのか','ななさい'],
        char_name:'レインぼう'
	},
	{
		pronunciation:[['シャ'],['くるま']],
		question:['下車','車中'],
		kanji:['下車','車中'],
		answer:['げしゃ','しゃちゅう'],
        char_name:'カーのすけ'
	},
	{
		pronunciation:[['シュ'],['て','た']],
		question:['王手','男手','空手','手中','(とくべつなよみかた)上手','先手','手足','手口','手先','手下','手本','入手','左手','人手','(とくべつなよみかた)下手','右手'],
		kanji:['王手','男手','空手','手中','上手','先手','手足','手口','手先','手下','手本','入手','左手','人手','下手','右手'],
		answer:['おうて','おとこで','からて','しゅちゅう','じょうず','せんて','てあし','てぐち','てさき','てした','てほん','にゅうしゅ','ひだりて','ひとで','へた','みぎて'],
        char_name:'ハンゾウ'
	},
	{
		pronunciation:[['ジュウ','ジッ'],['とお','と']],
		question:['十字','十日','二十','十手'],
		kanji:['十字','十日','二十','十手'],
		answer:['じゅうじ','とおか','にじゅう','じって'],
        char_name:'ジッテマン'
	},
	{
		pronunciation:[['シュツ','スイ'],['で(る)','だ(す)']],
		question:['出火','出口','出先','出す'],
		kanji:['出火','出口','出先','出'],
		answer:['しゅっか','でぐち','でさき','だ'],
        char_name:'デリュウ'
	},
	{
		pronunciation:[['ジョ','ニョ','ニョウ'],['おんな','め']],
		question:['女王','女子','男女'],
		kanji:['女王','女子','男女'],
		answer:['じょおう','じょし','だんじょ'],
        char_name:'ゆきおんな'
	},
	{
		pronunciation:[['ショウ'],['ちい(さい)','こ','お']],
		question:['小さい','小川','小石','小男','(とくべつなよみかた)小雨','小人','大小'],
		kanji:['小','小川','小石','小男','小雨','小人','大小'],
		answer:['ちい','おがわ','こいし','こおとこ','こさめ','こびと','だいしょう'],
        char_name:'スモールスモウマン'
	},
	{
		pronunciation:[['ジョウ','ショウ'],['うえ','うわ','かみ','あ(げる)','あ(がる)','のぼ(る)']],
		question:['上にいく','上がる','さかを上る','上目','上空','上下','(とくべつなよみかた)上手','年上','左上','右上','目上'],
		kanji:['上','上','上','上目','上空','上下','上手','年上','左上','右上','目上'],
		answer:['うえ','あ','のぼ','うわめ','じょうくう','じょうげ','じょうず','としうえ','ひだりうえ','みぎうえ','めうえ'],
        char_name:'アガール'
	},
	{
		pronunciation:[['シン'],['もり']],
		question:['森','森林'],
		kanji:['森','森林'],
		answer:['もり','しんりん'],
        char_name:'モーリー'
	},
	{
		pronunciation:[['ジン','ニン'],['ひと']],
		question:['(とくべつなよみかた)大人','小人','三人','人口','人生','人名','先人','人気','人手','(とくべつなよみかた)一人','(とくべつなよみかた)二人','本人','名人'],
		kanji:['大人','小人','三人','人口','人生','人名','先人','人気','人手','一人','二人','本人','名人'],
		answer:['おとな','こびと','さんにん','じんこう','じんせい','じんめい','せんじん','にんき','ひとで','ひとり','ふたり','ほんにん','めいじん'],
        char_name:'タダノヒト'
	},
	{
		pronunciation:[['スイ'],['みず']],
		question:['雨水','下水','水中','水田','水力','水玉','水虫'],
		kanji:['雨水','下水','水中','水田','水力','水玉','水虫'],
		answer:['あまみず','げすい','すいちゅう','すいでん','すいりょく','みずたま','みずむし'],
        char_name:'ポチャン'
	},
	{
		pronunciation:[['セイ','ショウ'],['ただ(しい)','ただ(す)','まさ']],
		question:['正月','正気'],
		kanji:['正月','正気'],
		answer:['しょうがつ','しょうき'],
        char_name:'タダシンジャー'
	},
	{
		pronunciation:[['セイ','ショウ'],['い(きる)','い(かす)','い(ける)','う(まれる)','う(む)','お(う)','は(える)','は(やす)','き','なま']],
		question:['一生','学生','人生','先生','生きる','生ゴミ','生まれる','生える','つぎに生かす'],
		kanji:['一生','学生','人生','先生','生','生','生','生','生'],
		answer:['いっしょう','がくせい','じんせい','せんせい','い','なま','う','は','い'],
        char_name:'セイメイ'
	},
	{
		pronunciation:[['セイ','ショウ'],['あお','あお(い)']],
		question:['青空','青虫','青年'],
		kanji:['青空','青虫','青年'],
		answer:['あおぞら','あおむし','せいねん'],
        char_name:'ブルーバード'
	},
	{
		pronunciation:[['セキ'],['ゆう']],
		question:['七夕','夕日'],
		kanji:['七夕','夕日'],
		answer:['たなばた','ゆうひ'],
        char_name:'夕日のユーフィー'
	},
	{
		pronunciation:[['セキ','シャク','コク'],['いし']],
		question:['小石','じ石にくっつく','いん石がおちてくる'],
		kanji:['小石','石','石'],
		answer:['こいし','しゃく','せき'],
        char_name:'イシマル'
	},
	{
		pronunciation:[['セキ','シャク'],['あか','あか(い)','あか(らむ)','あか(らめる)']],
		question:['赤貝','赤子','赤字','赤土','赤はんをたべる'],
		kanji:['赤貝','赤子','赤字','赤土','赤'],
		answer:['あかがい','あかご','あかじ','あかつち','せき'],
        char_name:'赤いリンゴロウ'
	},
	{
		pronunciation:[['セン'],['ち']],
		question:['千円','千代紙'],
		kanji:['千円','千代紙'],
		answer:['せんえん','ちよがみ'],
        char_name:'センボンザクラ'
	},
	{
		pronunciation:[['セン'],['かわ']],
		question:['小川'],
		kanji:['小川'],
		answer:['おがわ'],
        char_name:'カワナガレ'
	},
	{
		pronunciation:[['セン'],['さき']],
		question:['先月','先日','先人','先生','先手','手先','出先'],
		kanji:['先月','先日','先人','先生','先手','手先','出先'],
		answer:['せんげつ','せんじつ','せんじん','せんせい','せんて','てさき','でさき'],
        char_name:'サキバシリ'
	},
	{
		pronunciation:[['ソウ','サッ'],['はや(い)','はや(まる)','はや(める)']],
		question:['早口'],
		kanji:['早口'],
		answer:['はやくち'],
        char_name:'ハヤオキハヤオ'
	},
	{
		pronunciation:[['ソウ'],['くさ']],
		question:['草木','草花','草げん'],
		kanji:['草木','草花','草'],
		answer:['くさき','くさばな','そう'],
        char_name:'クサ'
	},
	{
		pronunciation:[['ソク'],['あし','た(りる)','た(る)','た(す)']],
		question:['足音','一足','手足','土足','左足','右足','足しざん','足りる'],
		kanji:['足音','一足','手足','土足','左足','右足','足','足'],
		answer:['あしおと','いっそく','てあし','どそく','ひだりあし','みぎあし','た','た'],
        char_name:'アシロー'
	},
	{
		pronunciation:[['ソン'],['むら']],
		question:['町村','村人'],
		kanji:['町村','村人'],
		answer:['ちょうそん','むらびと'],
        char_name:'ヴィレじい'
	},
	{
		pronunciation:[['ダイ','タイ'],['おお','おお(きい)','おお(いに)']],
		question:['大雨','大男','大口','大空','大目','大本','大人','大学','大小','大名'],
		kanji:['大雨','大男','大口','大空','大目','大本','大人','大学','大小','大名'],
		answer:['おおあめ','おおおとこ','おおくち','おおぞら','おおめ','おおもと','おとな','だいがく','だいしょう','だいみょう'],
        char_name:'ビッグエレファント'
	},
	{
		pronunciation:[['ダン','ナン'],['おとこ']],
		question:['大男','男手','小男','男子','男女'],
		kanji:['大男','男手','小男','男子','男女'],
		answer:['おおおとこ','おとこで','こおとこ','だんし','だんじょ'],
        char_name:'ウルフマン'
	},
	{
		pronunciation:[['チク'],['たけ']],
		question:['竹','竹わをたべる'],
		kanji:['竹','竹'],
		answer:['たけ','ちく'],
        char_name:'たけちゃん'
	},
	{
		pronunciation:[['チュウ','ジュウ'],['なか','うち']],
		question:['空中','車中','手中','水中','中立','日中','年中','文中'],
		kanji:['空中','車中','手中','水中','中立','日中','年中','文中'],
		answer:['くうちゅう','しゃちゅう','しゅちゅう','すいちゅう','ちゅうりつ','にっちゅう','ねんじゅう','ぶんちゅう'],
        char_name:'ナカンガルー'
	},
	{
		pronunciation:[['チュウ'],['むし']],
		question:['青虫','水虫','よう虫'],
		kanji:['青虫','水虫','虫'],
		answer:['あおむし','みずむし','ちゅう'],
        char_name:'てんとう虫'
	},
	{
		pronunciation:[['チョウ'],['まち']],
		question:['町村','町をあるく'],
		kanji:['町村','町'],
		answer:['ちょうそん','まち'],
        char_name:'マッチ'
	},
	{
		pronunciation:[['テン'],['あま','あめ']],
		question:['雨天','天下','天気','天空','天の川'],
		kanji:['雨天','天下','天気','天空','天'],
		answer:['うてん','てんか','てんき','てんくう','あま'],
        char_name:'天のつかい エンジェル'
	},
	{
		pronunciation:[['デン'],['た']],
		question:['水田','田んぼ'],
		kanji:['水田','田'],
		answer:['すいでん','た'],
        char_name:'タンぼう'
	},
	{
		pronunciation:[['ド','ト'],['つち']],
		question:['赤土','土足','土日'],
		kanji:['赤土','土足','土日'],
		answer:['あかつち','どそく','どにち'],
        char_name:'ツッチー'
	},
	{
		pronunciation:[['ニ'],['ふた','ふた(つ)']],
		question:['二十','二本','(とくべつなよみかた)二人','(とくべつなよみかた)二日'],
		kanji:['二十','二本','二人','二日'],
		answer:['にじゅう','にほん','ふたり','ふつか'],
        char_name:'二人のツインズ'
	},
	{
		pronunciation:[['ニチ','ジツ'],['ひ','か']],
		question:['五日','休日','九日','先日','一日','月日','十日','土日','七日','日中','日日','(とくべつなよみかた)二日','本日','三日','六日','八日','四日'],
		kanji:['五日','休日','九日','先日','一日','月日','十日','土日','七日','日中','日日','二日','本日','三日','六日','八日','四日'],
		answer:['いつか','きゅうじつ','ここのか','せんじつ','ついたち','つきひ','とおか','どにち','なのか','にっちゅう','ひにち','ふつか','ほんじつ','みっか','むいか','ようか','よっか'],
        char_name:'オヒサマ'
	},
	{
		pronunciation:[['ニュウ'],['い(る)','い(れる)','はい(る)']],
		question:['入口','入学','入手','入力','入れる','入る'],
		kanji:['入口','入学','入手','入力','入','入'],
		answer:['いりぐち','にゅうがく','にゅうしゅ','にゅうりょく','い','はい'],
        char_name:'ニューゲート'
	},
	{
		pronunciation:[['ネン'],['とし']],
		question:['一年','学年','青年','年上','年月','年中'],
		kanji:['一年','学年','青年','年上','年月','年中'],
		answer:['いちねん','がくねん','せいねん','としうえ','ねんげつ','ねんじゅう'],
        char_name:'いやーおじさん'
	},
	{
		pronunciation:[['ハク','ビャク'],['しろ','しら','しろ(い)']],
		question:['空白','白木','白子','白玉'],
		kanji:['空白','白木','白子','白玉'],
		answer:['くうはく','しらき','しらこ','しらたま'],
        char_name:'ホワイトタイガー'
	},
	{
		pronunciation:[['ハチ'],['や','やつ','やっ(つ)','よう']],
		question:['八日','八つ','八才','八十'],
		kanji:['八日','八','八才','八十'],
		answer:['ようか','やっ','はっさい','はちじゅう'],
        char_name:'ヤマタノオロチ'
	},
	{
		pronunciation:[['ヒャク'],['-']],
		question:['百円'],
		kanji:['百円'],
		answer:['ひゃくえん'],
        char_name:'百じゅうの王 ビーストキング'
	},
	{
		pronunciation:[['ブン','モン'],['ふみ']],
		question:['文学','文中','本文','(とくべつなよみかた)文字'],
		kanji:['文学','文中','本文','文字'],
		answer:['ぶんがく','ぶんちゅう','ほんぶん','もじ'],
        char_name:'サクブン'
	},
	{
		pronunciation:[['ボク','モク'],['き','こ']],
		question:['草木','白木','木目'],
		kanji:['草木','白木','木目'],
		answer:['くさき','しらき','もくめ'],
        char_name:'ツリー'
	},
	{
		pronunciation:[['ホン'],['もと']],
		question:['一本','大本','手本','二本','本気','本校','本日','本人','本音','本文','本名','見本'],
		kanji:['一本','大本','手本','二本','本気','本校','本日','本人','本音','本文','本名','見本'],
		answer:['いっぽん','おおもと','てほん','にほん','ほんき','ほんこう','ほんじつ','ほんにん','ほんね','ほんぶん','ほんみょう','みほん'],
        char_name:'ホンゾウ'
	},
	{
		pronunciation:[['メイ','ミョウ'],['な']],
		question:['人名','大名','本名','名字','名犬','名人','名まえ'],
		kanji:['人名','大名','本名','名字','名犬','名人','名'],
		answer:['じんめい','だいみょう','ほんみょう','みょうじ','めいけん','めいじん','な'],
        char_name:'ナマエモン'
	},
	{
		pronunciation:[['モク','ボク'],['め','ま']],
		question:['上目','大目','左目','右目','目上','目下','目玉','木目'],
		kanji:['上目','大目','左目','右目','目上','目下','目玉','木目'],
		answer:['うわめ','おおめ','ひだりめ','みぎめ','めうえ','めした','めだま','もくめ'],
        char_name:'メダマの王子'
	},
	{
		pronunciation:[['リツ','リュウ'],['た(つ)','た(てる)']],
		question:['立つ','中立'],
		kanji:['立','中立'],
		answer:['た','ちゅうりつ'],
        char_name:'タツオ'
	},
	{
		pronunciation:[['リョク','リキ'],['ちから']],
		question:['火力','学力','気力','水力','入力','かい力の男'],
		kanji:['火力','学力','気力','水力','入力','力'],
		answer:['かりょく','がくりょく','きりょく','すいりょく','にゅうりょく','りき'],
        char_name:'ゴリラのゴウリキ'
	},
	{
		pronunciation:[['リン'],['はやし']],
		question:['山林','森林','林'],
		kanji:['山林','森林','林'],
		answer:['さんりん','しんりん','はやし'],
        char_name:'林のリンタロー'
	},
	{
		pronunciation:[['ロク'],['む','むつ','むっ(つ)','むい']],
		question:['六日','六才','六つ'],
		kanji:['六日','六才','六'],
		answer:['むいか','ろくさい','むっ'],
        char_name:'サイコロック'
	}
];

const kanjiList = [
    ['一','右','雨','円','王','音','下','火','花','貝','学','気','九','休','玉','金','空','月','犬','見','五','口','校','左','三','山','子','四','糸','字','耳','七','車','手','十','出','女','小','上','森','人','水','正','生','青','夕','石','赤','千','川','先','早','草','足','村','大','男','竹','中','虫','町','天','田','土','二','日','入','年','白','八','百','文','木','本','名','目','立','力','林','六'],
    ['引','羽','雲','園','遠','何','科','夏','家','歌','画','回','会','海','絵','外','角','楽','活','間','丸','岩','顔','汽','記','帰','弓','牛','魚','京','強','教','近','兄','形','計','元','言','原','戸','古','午','後','語','工','公','広','交','光','考','行','高','黄','合','谷','国','黒','今','才','細','作','算','止','市','矢','姉','思','紙','寺','自','時','室','社','弱','首','秋','週','春','書','少','場','色','食','心','新','親','図','数','西','声','星','晴','切','雪','船','線','前','組','走','多','太','体','台','地','池','知','茶','昼','長','鳥','朝','直','通','弟','店','点','電','刀','冬','当','東','答','頭','同','道','読','内','南','肉','馬','売','買','麦','半','番','父','風','分','聞','米','歩','母','方','北','毎','妹','万','明','鳴','毛','門','夜','野','友','用','曜','来','里','理','話'],
    ['悪','安','暗','医','委','意','育','員','院','飲','運','泳','駅','央','横','屋','温','化','荷','界','開','階','寒','感','漢','館','岸','起','期','客','究','急','級','宮','球','去','橋','業','曲','局','銀','区','苦','具','君','係','軽','血','決','研','県','庫','湖','向','幸','港','号','根','祭','皿','仕','死','使','始','指','歯','詩','次','事','持','式','実','写','者','主','守','取','酒','受','州','拾','終','習','集','住','重','宿','所','暑','助','昭','消','商','章','勝','乗','植','申','身','神','真','深','進','世','整','昔','全','相','送','想','息','速','族','他','打','対','待','代','第','題','炭','短','談','着','注','柱','丁','帳','調','追','定','庭','笛','鉄','転','都','度','投','豆','島','湯','登','等','動','童','農','波','配','倍','箱','畑','発','反','坂','板','皮','悲','美','鼻','筆','氷','表','秒','病','品','負','部','服','福','物','平','返','勉','放','味','命','面','問','役','薬','由','油','有','遊','予','羊','洋','葉','陽','様','落','流','旅','両','緑','礼','列','練','路','和'],
    ['愛','案','以','衣','位','茨','印','英','栄','媛','塩','岡','億','加','果','貨','課','芽','賀','改','械','害','街','各','覚','潟','完','官','管','関','観','願','岐','希','季','旗','器','機','議','求','泣','給','挙','漁','共','協','鏡','競','極','熊','訓','軍','郡','群','径','景','芸','欠','結','建','健','験','固','功','好','香','候','康','佐','差','菜','最','埼','材','崎','昨','札','刷','察','参','産','散','残','氏','司','試','児','治','滋','辞','鹿','失','借','種','周','祝','順','初','松','笑','唱','焼','照','城','縄','臣','信','井','成','省','清','静','席','積','折','節','説','浅','戦','選','然','争','倉','巣','束','側','続','卒','孫','帯','隊','達','単','置','仲','沖','兆','低','底','的','典','伝','徒','努','灯','働','特','徳','栃','奈','梨','熱','念','敗','梅','博','阪','飯','飛','必','票','標','不','夫','付','府','阜','富','副','兵','別','辺','変','便','包','法','望','牧','末','満','未','民','無','約','勇','要','養','浴','利','陸','良','料','量','輪','類','令','冷','例','連','老','労','録'],
    ['圧','囲','移','因','永','営','衛','易','益','液','演','応','往','桜','可','仮','価','河','過','快','解','格','確','額','刊','幹','慣','眼','紀','基','寄','規','喜','技','義','逆','久','旧','救','居','許','境','均','禁','句','型','経','潔','件','険','検','限','現','減','故','個','護','効','厚','耕','航','鉱','構','興','講','告','混','査','再','災','妻','採','際','在','財','罪','殺','雑','酸','賛','士','支','史','志','枝','師','資','飼','示','似','識','質','舎','謝','授','修','述','術','準','序','招','証','象','賞','条','状','常','情','織','職','制','性','政','勢','精','製','税','責','績','接','設','絶','祖','素','総','造','像','増','則','測','属','率','損','貸','態','団','断','築','貯','張','停','提','程','適','統','堂','銅','導','得','毒','独','任','燃','能','破','犯','判','版','比','肥','非','費','備','評','貧','布','婦','武','復','複','仏','粉','編','弁','保','墓','報','豊','防','貿','暴','脈','務','夢','迷','綿','輸','余','容','略','留','領','歴'],
    ['胃','異','遺','域','宇','映','延','沿','恩','我','灰','拡','革','閣','割','株','干','巻','看','簡','危','机','揮','貴','疑','吸','供','胸','郷','勤','筋','系','敬','警','劇','激','穴','券','絹','権','憲','源','厳','己','呼','誤','后','孝','皇','紅','降','鋼','刻','穀','骨','困','砂','座','済','裁','策','冊','蚕','至','私','姿','視','詞','誌','磁','射','捨','尺','若','樹','収','宗','就','衆','従','縦','縮','熟','純','処','署','諸','除','承','将','傷','障','蒸','針','仁','垂','推','寸','盛','聖','誠','舌','宣','専','泉','洗','染','銭','善','奏','窓','創','装','層','操','蔵','臓','存','尊','退','宅','担','探','誕','段','暖','値','宙','忠','著','庁','頂','腸','潮','賃','痛','敵','展','討','党','糖','届','難','乳','認','納','脳','派','拝','背','肺','俳','班','晩','否','批','秘','俵','腹','奮','並','陛','閉','片','補','暮','宝','訪','亡','忘','棒','枚','幕','密','盟','模','訳','郵','優','預','幼','欲','翌','乱','卵','覧','裏','律','臨','朗','論']
];


window.onload = function () {

    if (window.name != "any") {
        location.reload();
        window.name = "any";
    } else {
        window.name = "";
    }

}

let kanjiGrade = 0;
let kanjiNumber = 0;
let passData = 0;
const quizLength = quiz.length;



//漢字の読みクイズのセットアップ
const setUpQuiz = (kanjiNumber, quiz) => {
	
	//指定学年に合わせて漢字ボタンを作成
	let kanjiCloneCounter = 0;
	while(kanjiCloneCounter < kanjiList[kanjiGrade].length-1){
		let kanjiClone = document.getElementsByClassName('kanjis');
		let cloneElement = kanjiClone[kanjiCloneCounter].cloneNode(true);
		kanjiClone[kanjiCloneCounter].after(cloneElement);
		kanjiCloneCounter++;
	}
	setKanji(kanjiGrade);
	
	//漢字の読みクイズをあるだけ作成
	let cloneCounter = 0;
		while(cloneCounter < quiz[kanjiNumber].question.length-1){
		let quizClone = document.getElementsByClassName('quiz_clone');
		let cloneElement = quizClone[cloneCounter].cloneNode(true);
		quizClone[cloneCounter].after(cloneElement);
		cloneCounter++;
	}

	const $question = document.getElementsByClassName('kanji-question');
	const $how_to_read = document.getElementsByClassName('how_to_read');
	
	//クイズ作成
	let inputCounter = 0;
	while(inputCounter < quiz[kanjiNumber].question.length){
		let inputToSplit = quiz[kanjiNumber].question[inputCounter].split(quiz[kanjiNumber].kanji[inputCounter]);
		$question[inputCounter].textContent = String(inputCounter+1) + '、 ' + inputToSplit[0] + ' [ ' + quiz[kanjiNumber].kanji[inputCounter] + ' ] ' + inputToSplit[1];
		$how_to_read[inputCounter].value = '';
		inputCounter++;
	}
	document.getElementById('correct_message').textContent = '';
	goToQuestion(kanjiGrade);
	hiddenRegisterBtn();
	setKanjiColor(kanjiGrade);
	changePassKanjiColor();
}
setUpQuiz(kanjiNumber, quiz);
document.getElementById('kanji').textContent = kanjiList[kanjiGrade][0];
document.getElementById('on_yomi').textContent = '音読み： ' + quiz[kanjiNumber].pronunciation[0];
document.getElementById('kun_yomi').textContent = '訓読み： ' + quiz[kanjiNumber].pronunciation[1];



//漢字の読みクイズの合否判定
function judge() {
	let score = 0;
	let quizLength = quiz[kanjiNumber].question.length;

	let answerToShow = document.getElementsByClassName('kanji-answer');

	for(let i = 0; i < quizLength; i++){
		let $answer = document.getElementsByClassName('how_to_read')[i].value;
		answerToShow[i].textContent = quiz[kanjiNumber].answer[i];
		if ($answer == quiz[kanjiNumber].answer[i]){
			score++;
		}
	}
	setTimeout(removeAnswer,3000);

	if (score == quizLength){
		document.getElementById('correct_message').textContent = '全問正解です！！（' + score + '点/' + quizLength + '点中）';
		$targetPassKanji = document.getElementById('kanji');
		passNumber = kanjiList[kanjiGrade].indexOf($targetPassKanji.textContent);
		passData = passNumber;

		$('#congratulations').css('visibility','visible');
		$('#registerButton').css('visibility','visible');
		openPopup(kanjiGrade, kanjiNumber);
	} else {
		document.getElementById('correct_message').textContent = '残念！もう一度やってみよう！！';
	}

}


//答えを消す
function removeAnswer(){
	let quizLength = quiz[kanjiNumber].question.length;
	let answerToShow = document.getElementsByClassName('kanji-answer');
	for(let i = 0; i < quizLength; i++){
		answerToShow[i].textContent = '';
	}
}


//各学年の漢字に色をつける
function setKanjiColor(kanjiGrade){
	let colorList = ['#ffdbdb','#ffdbed','#eddbff','#dbdbff','#dbedff','#ffeddb'];
	if(kanjiGrade == 0){
		changeColor(colorList[0]);
	}else if(kanjiGrade == 1){
		changeColor(colorList[1]);
	}else if(kanjiGrade == 2){
		changeColor(colorList[2]);
	}else if(kanjiGrade == 3){
		changeColor(colorList[3]);
	}else if(kanjiGrade == 4){
		changeColor(colorList[4]);
	}else if(kanjiGrade == 5){
		changeColor(colorList[5]);
	}
}

//色変え
function changeColor(color){
	const $kanjiList = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].style.backgroundColor = color;
	}
	setHover(color);
}

function setHover(color){
	let $mouseover = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $mouseover.length; i++){
		$mouseover[i].addEventListener('mouseover', function() {
			$mouseover[i].style.backgroundColor = 'white';
		});
		$mouseover[i].addEventListener('mouseleave', function() {
			$mouseover[i].style.backgroundColor = color;
		});
	}
}





//指定された学年の漢字をボタンに書き込む
function setKanji(kanjiGrade){
	const $kanjiList = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].textContent = kanjiList[kanjiGrade][i];
	}
	//漢字ボタンのクリック機能(漢字大きく表示)をオンにする
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].addEventListener('click', showKanji, false);
	}

}





//前回のクイズ削除
function removeQuiz(){
	removeAnswer();
	let cloneRemoveCounter = quiz[kanjiNumber].question.length-1;
		while(cloneRemoveCounter > 0 ){
			let quizCloneToRemove = document.getElementsByClassName('quiz_clone');
			quizCloneToRemove[cloneRemoveCounter].remove();
			cloneRemoveCounter--;
		}
}





//前回の学年の漢字削除
function removeKanji(){
	let cloneRemoveCounter = kanjiList[kanjiGrade].length-1;
		while(cloneRemoveCounter > 0 ){
			let quizCloneToRemove = document.getElementsByClassName('kanjis');
			quizCloneToRemove[cloneRemoveCounter].remove();
			cloneRemoveCounter--;
		}
	document.getElementsByClassName('kanjis')[0].textContent = kanjiList[kanjiGrade][0];
}




//漢字ボタンを押すと、その漢字を大きく表示
function showKanji(e){
	removeQuiz();
	removeKanji();

	$targetKanji = document.getElementById('kanji');
	$targetKanji.textContent = e.target.textContent;
	kanjiNumber = kanjiList[kanjiGrade].indexOf($targetKanji.textContent);

	document.getElementById('on_yomi').textContent = '音読み： ' + quiz[kanjiNumber].pronunciation[0];
	document.getElementById('kun_yomi').textContent = '訓読み： ' + quiz[kanjiNumber].pronunciation[1];

	
	document.getElementsByClassName('how_to_read')[0].value = '';
	
	setUpQuiz(kanjiNumber, quiz);
}




function hiddenRegisterBtn() {
    $('#congratulations').css('visibility','hidden');
	$('#registerButton').css('visibility','hidden');
}




//答え合わせボタンでjudge()発動
document.addEventListener('DOMContentLoaded', () => {
    const answerButton = document.getElementById("answerButton");
    answerButton.addEventListener("click", () => { judge() });
});

//学年変更ボタンでchangeGrade()発動
document.addEventListener('DOMContentLoaded', () => {
	const changeGradeButton = document.getElementsByClassName("changeGradeButton");
	for(let i = 0; i < changeGradeButton.length; i++){
    	changeGradeButton[i].addEventListener("click", () => { changeGrade(i) });
	}
});


//railsに正解した漢字のデータをpost
function postData(){

	$.ajax({
		url: '/kanji_quiz/update',
		type: 'GET',
		dataType: 'text',
		async: true,
		data: {
			grade: String(kanjiGrade),
			passData: String(passData),
		},
	});
}


//図鑑に登録ボタンでpostData()発動
let login_checker = document.getElementById('login_checker');
if(login_checker.textContent == 'true'){
	document.addEventListener('DOMContentLoaded', () => {
		const registerButton = document.getElementById("registerButton");
		registerButton.addEventListener("click", () => { postData() });
	});
}



//合格時のアニメーション
function openPopup(grade, num){
	let img = document.getElementById('image_file');
	let imgName = '/image' + grade + '_' + num + '.jpg';
	
	if(grade > 0){
		imgName = '/dummy.jpg';
	}
	img.src = imgName;
	document.querySelector('#image_file').animate(
		[
			{ transform: 'scale(0)' },
			{ transform: 'scale(2)' },
			{ transform: 'translate(0, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(5px, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(5px, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(0, 0)'},
			{ transform: 'translate(0, 0)'}
		],
		{
		  duration: 3000,
		  iterations: 1,
		  direction: 'normal'
		}
	);
	let popup = document.getElementById('js-popup');
	popup.classList.add('is-show');
	let passMessage = document.getElementById('pass_message');
	passMessage.style.visibility = 'visible';
	let charName = document.getElementById('char_name');
	charName.textContent = quiz[num].char_name;
	charName.style.visibility = 'visible';
}

function closePopUp() {
	let popup = document.getElementById('js-popup');
	let blackBg = document.getElementById('js-black-bg');
	let closeBtn = document.getElementById('js-close-btn');
	let img = document.getElementById('image_file');
	blackBg.addEventListener('click', function() {
		popup.classList.remove('is-show');
		document.getElementById('pass_message').style.visibility = 'hidden';
		document.getElementById('char_name').style.visibility = 'hidden';
		img.src = '/white.jpg';
	});
	closeBtn.addEventListener('click', function() {
		popup.classList.remove('is-show');
		document.getElementById('pass_message').style.visibility = 'hidden';
		document.getElementById('char_name').style.visibility = 'hidden';
		img.src = '/white.jpg';
	});
}
closePopUp();


let pageTop = document.getElementById('page_top');
pageTop.addEventListener('click', function() {
	$('html, body').animate({scrollTop:0},400);
});

function goToQuestion(kanjiGrade){
	let $goToQues = document.getElementsByClassName('kanjis');
	let $target = document.getElementById('hidden_block');
	for(let i = 0; i < kanjiList[kanjiGrade].length; i++){
		$goToQues[i].addEventListener('click', function() {
			$target.scrollIntoView({
				behavior: "smooth",
				block: "start",
				inline: "nearest"
			  });
		});
	}
}


//合格漢字の色を変える
function changePassKanjiColor(){
	//forで正解配列作る処理
	let login_checker = document.getElementById('login_checker');
	if(login_checker.textContent == 'true'){
		let $dummy = document.getElementsByClassName('dummy_data');
		let correctList = [];
		for(let i = 1; i < $dummy.length; i++){
			let splitData = $dummy[i].textContent.trim();
			splitData = splitData.slice(0,-1);
			let splitList = splitData.split(',');
			correctList.push(splitList);
		}
		

		let newColorList = ['#ff7f7f', '#ff7fbf', '#bf7fff', '#7f7fff', '#7fbfff', '#ffbf7f'];
		const $kanjiList = document.getElementsByClassName('kanjis');
		for(let i = 0; i < correctList[kanjiGrade].length; i++){
			let num = correctList[kanjiGrade][i];
			if(num != ''){
				$kanjiList[num].style.backgroundColor = newColorList[kanjiGrade];
				$kanjiList[num].addEventListener('mouseleave', function() {
					$kanjiList[num].style.backgroundColor = newColorList[kanjiGrade];	
				});
			}
		}
	}
	
}